import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/bcon_demo/bcon_icon.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/bcon_demo_screen.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/custom_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MapDisplayScreen extends StatefulWidget {
  final NordicNrfMesh nordicNrfMesh;
  final MeshManagerApi meshManagerApi;
  final bool isConnected;

  const MapDisplayScreen({
    Key? key,
    required this.nordicNrfMesh,
    required this.meshManagerApi,
    this.isConnected = false,
  }) : super(key: key);

  @override
  State<MapDisplayScreen> createState() => _MapDisplayScreenState();
}

class _MapDisplayScreenState extends State<MapDisplayScreen> {
  Timer? _timer;
  List<int> locationElementAddresses = [];

  LatLng faradineLocation = const LatLng(38.0477954086192, -84.45855714112285);

  final bleMeshManager = BleMeshManager();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  void dispose() {
    _timer!.cancel();
    _deinit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bconState = context.watch<BconDemoState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Map Display')),
      body: Column(
        children: [
          if (isLoading)
            const Column(
              children: [
                SizedBox(height: 20),
                CircularProgressIndicator(),
                Text('Connecting to proxy node'),
                SizedBox(height: 20),
              ],
            )
          else
            Column(
              children: [
                if (bconState.locations.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...bconState.locations.asMap().entries.map((entry) {
                        int index = entry.key;
                        Location location = entry.value;
                        if (location.responsive) {
                          return ExpansionTile(
                            initiallyExpanded: false,
                            expandedAlignment: Alignment.centerLeft,
                            title: Text('BCON $index Location Details'),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Latitude: ${location.latitude.toStringAsPrecision(10)}'),
                                    Text('Longitude: ${location.longitude.toStringAsPrecision(10)}'),
                                    Text('Altitude: ${location.altitude}m, ${(location.altitude * 3.28).round()}ft'),
                                    Text(location.responsive ? 'Connected' : 'Disconnected'),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      })
                    ],
                  ),
              ],
            ),
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: faradineLocation,
                initialZoom: 17.0,
                minZoom: 2.0,
              ),
              children: [
                TileLayer(
                  // Display map tiles from any source
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                  userAgentPackageName: 'com.example.app',
                ),
                CurrentLocationLayer(),
                RichAttributionWidget(
                  // Include a stylish prebuilt attribution widget that meets all requirments
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // (external)
                    ),
                    // Also add images...
                  ],
                ),
                MarkerLayer(
                  rotate: true,
                  markers: [
                    ...bconState.locations.asMap().entries.map((entry) {
                      int index = entry.key;
                      Location location = entry.value;

                      return Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(location.latitude, location.longitude),
                        child: Container(
                          // Colored border to show where the marker really is
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.blue, // Border color
                            //   width: 1.0, // Border width (thin)
                            // ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BconIcon(color: bconState.colors.length > index ? bconState.colors[index] : Colors.black),
                              Text(
                                "BCON $index",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      blurRadius: 2.0, // Spread of the shadow
                                      color: Colors.black.withOpacity(0.5), // Shadow color with transparency
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList()
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _init() async {
    // get nodes (ignore first node which is the default provisioner)
    var nodes = (await widget.meshManagerApi.meshNetwork!.nodes).skip(1).toList();
    // will bind app keys (needed to be able to configure node)
    if (!widget.isConnected) {
      await connectToProxy();
    } else {
      setState(() {
        isLoading = false;
      });
    }

    for (final node in nodes) {
      final elements = await node.elements;
      for (final element in elements) {
        for (final model in element.models) {
          if (model.boundAppKey.isEmpty) {
            if (element == elements.first && model == element.models.first) {
              debugPrint('Element is first? ${element == elements.first}');
              debugPrint('Model is first? ${model == element.models.first}');
              continue;
            }
            final unicast = await node.unicastAddress;
            debugPrint('need to bind app key');
            await widget.meshManagerApi.sendConfigModelAppBind(
              unicast,
              element.address,
              model.modelId,
            );
            debugPrint('send config done');
          }

          // grab all the location servers available
          if (model.modelId == 0x100E) {
            locationElementAddresses.add(element.address);

            int index = locationElementAddresses.length - 1;

            // Access the ChangeNotifier
            if (mounted) {
              // WidgetsBinding.instance.addPostFrameCallback((_) {
              final bconState = Provider.of<BconDemoState>(context, listen: false);

              // Add new location to bconState if it doesn't exist
              if (bconState.locations.length <= index) {
                bconState.addLocation(Location(latitude: 0, longitude: 0, altitude: 0, responsive: false));
              }
              // });
            }
          }
        }
      }
    }

    startTimer();
  }

  Future<void> connectToProxy() async {
    bleMeshManager.callbacks = DoozProvisionedBleMeshManagerCallbacks(widget.meshManagerApi, bleMeshManager);
    DiscoveredDevice? device;
    final completer = Completer<void>();

    // Find a proxy device
    widget.nordicNrfMesh.scanForProxy().listen((proxyDevice) async {
      device = proxyDevice;
      if (!completer.isCompleted) {
        completer.complete();
      }
    });

    // Wait until the completer is completed, meaning the proxy device is assigned
    await completer.future;
    await bleMeshManager.connect(device!);

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      final bconState = Provider.of<BconDemoState>(context, listen: false);

      for (int i = 0; i < locationElementAddresses.length; i++) {
        int address = locationElementAddresses[i];
        try {
          var status =
              await widget.meshManagerApi.sendGenericLocationGlobalGet(address).timeout(const Duration(seconds: 5));

          // Duplicating functionality of getPosition function from GlobalLatitude.java and GlobalLongitude.java
          double newLatitude = (status.latitude.toDouble()) / (pow(2, 31) - 1) * 90;
          // add or subtract 90 to account for stupid encoding thing since uint32_t cast in c doesn't like negative doubles
          if (status.latitude < 0) {
            newLatitude += 90;
          } else {
            newLatitude -= 90;
          }

          // Duplicating functionality of getPosition function from GlobalLatitude.java and GlobalLongitude.java
          double newLongitude = (status.longitude.toDouble()) / (pow(2, 31) - 1) * 180;
          // add or subtract 180 to account for stupid encoding thing since uint32_t cast in c doesn't like negative doubles
          if (status.longitude < 0) {
            newLongitude += 180;
          } else {
            newLongitude -= 180;
          }

          // Good practice to setState only where actually changing state variables and not do any calculation in this function
          if (mounted) {
            bconState.updateLocation(i,
                Location(latitude: newLatitude, longitude: newLongitude, altitude: status.altitude, responsive: true));
          }
        } on TimeoutException catch (_) {
          // scaffoldMessenger.clearSnackBars();
          // scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
          if (mounted) {
            bconState.updateLocationResponsive(i, false);
          }
        } on PlatformException catch (e) {
          scaffoldMessenger.clearSnackBars();
          scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
        } catch (e) {
          scaffoldMessenger.clearSnackBars();
          scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    });
  }

  void _deinit() async {
    // Only disconnect from proxy if map was launched as standalone and not from bcon demo or some other screen that is connected to proxy
    if (!widget.isConnected) {
      await bleMeshManager.disconnect();
      await bleMeshManager.callbacks?.dispose();
    }
  }
}

class Location {
  double latitude;
  double longitude;
  int altitude;
  bool responsive;

  Location({
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.responsive,
  });

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude, altitude: $altitude)';
  }
}
