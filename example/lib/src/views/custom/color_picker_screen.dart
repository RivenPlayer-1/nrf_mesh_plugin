import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/control_module/module.dart';
import 'package:nordic_nrf_mesh_example/src/app.dart';

class ColorPickerScreen extends StatefulWidget {
  final MeshManagerApi meshManagerApi;
  final NordicNrfMesh nordicNrfMesh;

  const ColorPickerScreen({super.key, required this.meshManagerApi, required this.nordicNrfMesh});

  @override
  State<ColorPickerScreen> createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  // Connection stuff
  final bleMeshManager = BleMeshManager();

  late List<int> addresses;

  DiscoveredDevice? _device;
  StreamSubscription<DiscoveredDevice>? _scanSubscription;
  final Completer<void> _deviceSet = Completer<void>();

  bool isConnecting = true;
  bool isScanning = true;

  // Color picker stuff
  final _controller = CircleColorPickerController(
    initialColor: Colors.blue,
  );

  Timer? _colorChangeTimer;

  @override
  void initState() {
    super.initState();
    _scanProvisionned();
    // isScanning = false;
    _init(widget.meshManagerApi);
  }

  @override
  void dispose() {
    _deinit();
    super.dispose();
    _scanSubscription?.cancel();
  }

  Widget buildSpacer() {
    return const SizedBox(
      width: 40,
      height: 40,
    );
  } // buildSpacer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Control for generic_level_set')),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (!isConnecting)
            const Center(
                child: Column(
              children: [
                Text('Done connecting'),
              ],
            ))
          else if (isScanning)
            const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  Text('Scanning for a provisioned device ...'),
                ],
              ),
            )
          else
            const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  Text('Connecting to device ...'),
                ],
              ),
            ),

          // Always present
          CircleColorPicker(
            controller: _controller,
            onChanged: (color) {
              // Check if a second has passed since the last call
              if (_colorChangeTimer == null || !_colorChangeTimer!.isActive) {
                setColor(color);

                // Start a new timer for 1/20 second
                _colorChangeTimer = Timer(const Duration(milliseconds: 50), () {
                  _colorChangeTimer = null; // Reset the timer after it expires
                });
              }
            },
            // onEnded: (color) => setColor(color), // only triggers on finger up
            size: const Size(240, 240),
            strokeWidth: 4,
            thumbSize: 36,
          ),
        ]));
  }

  // Set color over BT Mesh
  void setColor(color) async {
    debugPrint("[ColorSelector] RGB: ${color.red}, ${color.green}, ${color.blue}");

    final scaffoldMessenger = ScaffoldMessenger.of(context); // for snackbars (bottom of screen pop ups)
    try {
      await widget.meshManagerApi
          .sendGenericLevelSet(addresses[0], ((color.red * 65355 / 255) - 32768).round())
          .timeout(const Duration(seconds: 5)); // originally set to 40 which is probably more reasonable
      await widget.meshManagerApi
          .sendGenericLevelSet(addresses[1], ((color.green * 65355 / 255) - 32768).round())
          .timeout(const Duration(seconds: 5));
      await widget.meshManagerApi
          .sendGenericLevelSet(addresses[2], ((color.blue * 65355 / 255) - 32768).round())
          .timeout(const Duration(seconds: 5));

      // Error handling
    } on TimeoutException catch (_) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
    } on PlatformException catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  // This code is duplicated in switches_screen.dart
  Future<void> _init(MeshManagerApi meshManagerApi) async {
    /* Aquire addresses */
    // get nodes (ignore first node which is the default provisioner)
    List<ProvisionedMeshNode> nodes = (await widget.meshManagerApi.meshNetwork!.nodes).skip(1).toList();
    ProvisionedMeshNode deviceNode = nodes[1]; // Not ideal if multiple devices are provisioned // FIX and clean up here
    // get first node where device name is Mesh Light Fixture

    for (int i = 0; i < nodes.length; i++) {
      final deviceName = meshManagerApi.meshNetwork!.deviceMap[nodes[i].uuid]?.deviceName;
      if (deviceName == "Mesh Light Fixture") {
        deviceNode = nodes[i];
        break;
      }
    }

    List<ElementData> elements = await deviceNode.elements;
    addresses = elements.map((element) => element.address).toList();

    /* Wait until _scanProvisionned is complete */
    await _deviceSet.future;
    setState(() {
      isScanning = false;
    });

    /* Connect to device */
    bleMeshManager.callbacks = DoozProvisionedBleMeshManagerCallbacks(widget.meshManagerApi, bleMeshManager);
    await bleMeshManager.connect(_device!);

    // will bind app keys (needed to be able to configure node)
    for (final element in elements) {
      for (final model in element.models) {
        if (model.boundAppKey.isEmpty) {
          if (element == elements.first && model == element.models.first) {
            // skips over config server I believe
            continue;
          }
          final unicast = await deviceNode.unicastAddress;

          // App key is bound here
          await widget.meshManagerApi.sendConfigModelAppBind(
            unicast,
            element.address,
            model.modelId,
          );
        }
      }
    }

    setState(() {
      isConnecting = false;
    });
  }

  // Scan for provisioned bluetooth devices and set the first one as device
  // This code is duplicated in switches_screen.dart
  Future<void> _scanProvisionned() async {
    await checkAndAskPermissions();
    _scanSubscription = widget.nordicNrfMesh.scanForProxy().listen((foundDevice) async {
      if (_device == null || _device!.id != foundDevice.id) {
        setState(() {
          _device = foundDevice;
          isScanning = false;
        });
        _deviceSet.complete();
        await _scanSubscription?.cancel();
      }
    });
  }

  void _deinit() async {
    await bleMeshManager.disconnect();
    await bleMeshManager.callbacks!.dispose();
  }
}
