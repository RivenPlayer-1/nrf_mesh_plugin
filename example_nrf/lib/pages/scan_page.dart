import 'dart:async';

import 'package:example_nrf/util/nrf_manager.dart';
import 'package:example_nrf/widgets/discovered_device_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ScanPageState();
  }
}

class _ScanPageState extends State<ScanPage> {
  late List<DiscoveredDevice> deviceList = [];
  late StreamSubscription<DiscoveredDevice> _scanResults;

  late NordicNrfMesh nordicNrfMesh;
  late MeshManagerApi meshManagerApi;
  late BleMeshManager bleMeshManager = BleMeshManager();

  var isScanning = false;
  var isProvisioning = false;

  @override
  void initState() {
    super.initState();
    initMesh();
    _startScan();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Future.microtask(() async {
      _stopScan();
    });
  }

  void initMesh() async {
    nordicNrfMesh = NrfManager().nordicNrfMesh;
    meshManagerApi = nordicNrfMesh.meshManagerApi;
  }

  void _startScan() async {
    if (isScanning) {
      return;
    }
    setState(() {
      isScanning = true;
    });
    _scanResults = nordicNrfMesh.scanForUnprovisionedNodes().listen((
      discoveredDevice,
    ) {
      var isExist = false;
      for (var device in deviceList) {
        if (device.id == discoveredDevice.id) {
          device = discoveredDevice;
          isExist = true;
          break;
        }
      }
      if (isExist) {
        return;
      }
      setState(() {
        deviceList.add(discoveredDevice);
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      _stopScan();
    });
  }

  void _stopScan() async {
    await _scanResults.cancel();
    if (mounted) {
      setState(() {
        isScanning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan')),
      body: RefreshIndicator(
        onRefresh: () async => _startScan(),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: deviceList.length,
              itemBuilder: (context, index) {
                return DiscoveredDeviceItem(
                  device: deviceList[index],
                  onIdentify: () => identifyDevice(deviceList[index]),
                  onProvisioning: () => provisioningDevice(deviceList[index]),
                );
              },
            ),
            isScanning
                ? Center(child: CircularProgressIndicator())
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  void identifyDevice(DiscoveredDevice device) async {
    await nordicNrfMesh.identify(
      meshManagerApi,
      bleMeshManager,
      device,
      NrfManager().getDeviceUuid(device),
      // events: provisioningEvent,
    );
  }

  void provisioningDevice(DiscoveredDevice device) async {
    ProvisioningEvent provisioningEvent = ProvisioningEvent();
    if (isProvisioning) {
      return;
    }
    isProvisioning = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ProvisioningDialog(provisioningEvent: provisioningEvent),
    );
    var provisionedNode = await nordicNrfMesh.provisioning(
      meshManagerApi,
      bleMeshManager,
      device,
      NrfManager().getDeviceUuid(device),
      events: provisioningEvent,
    );
    provisionedNode.nodeName = device.name;
    Future.delayed(Duration(seconds: 1), () async {
      var name = await provisionedNode.name;
      print("provisionedNode name = ${name}");
      isProvisioning = false;
      Navigator.pop(context);
    });
  }
}

class ProvisioningDialog extends StatelessWidget {
  final ProvisioningEvent provisioningEvent;

  const ProvisioningDialog({Key? key, required this.provisioningEvent})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const LinearProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Text('Steps :'),
                  Column(
                    children: [
                      ProvisioningState(
                        text: 'onProvisioningCapabilities',
                        stream: provisioningEvent.onProvisioningCapabilities
                            .map((event) => true),
                      ),
                      ProvisioningState(
                        text: 'onProvisioning',
                        stream: provisioningEvent.onProvisioning.map(
                          (event) => true,
                        ),
                      ),
                      ProvisioningState(
                        text: 'onProvisioningReconnect',
                        stream: provisioningEvent.onProvisioningReconnect.map(
                          (event) => true,
                        ),
                      ),
                      ProvisioningState(
                        text: 'onConfigCompositionDataStatus',
                        stream: provisioningEvent.onConfigCompositionDataStatus
                            .map((event) => true),
                      ),
                      ProvisioningState(
                        text: 'onConfigAppKeyStatus',
                        stream: provisioningEvent.onConfigAppKeyStatus.map((
                          event,
                        ) {
                          return true;
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProvisioningState extends StatelessWidget {
  final Stream<bool> stream;
  final String text;

  const ProvisioningState({Key? key, required this.stream, required this.text})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: stream,
      builder: (context, snapshot) {
        return Row(
          children: [
            Text(text),
            const Spacer(),
            Checkbox(value: snapshot.data, onChanged: null),
          ],
        );
      },
    );
  }
}
