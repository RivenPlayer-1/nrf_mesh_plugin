import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/control_module/module.dart';
import 'package:nordic_nrf_mesh_example/src/app.dart';

import '../../widgets/light_button.dart';

class SwitchesScreen extends StatefulWidget {
  final MeshManagerApi meshManagerApi;
  final NordicNrfMesh nordicNrfMesh;

  const SwitchesScreen({super.key, required this.meshManagerApi, required this.nordicNrfMesh});

  @override
  State<SwitchesScreen> createState() => _SwitchesScreenState();
}

class _SwitchesScreenState extends State<SwitchesScreen> {
  final bleMeshManager = BleMeshManager();

  late List<int> addresses;

  DiscoveredDevice? _device;
  StreamSubscription<DiscoveredDevice>? _scanSubscription;
  final Completer<void> _deviceSet = Completer<void>();

  bool isConnecting = true;
  bool isScanning = true;

  @override
  void initState() {
    super.initState();
    _scanProvisionned();
    _init();
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

  // TODO, make this code not as hard coded
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Control for Mesh Light')),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (!isConnecting)
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LightButton(index: 0, address: addresses[0], meshManagerApi: widget.meshManagerApi),
                      buildSpacer(),
                      LightButton(index: 2, address: addresses[2], meshManagerApi: widget.meshManagerApi),
                    ],
                  ),
                  buildSpacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LightButton(index: 1, address: addresses[1], meshManagerApi: widget.meshManagerApi),
                      buildSpacer(),
                      LightButton(index: 3, address: addresses[3], meshManagerApi: widget.meshManagerApi),
                    ],
                  ),
                ],
              ),
            )
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
            )
        ]));
  }

  Future<void> _init() async {
    /* Aquire addresses */
    // get nodes (ignore first node which is the default provisioner)
    List<ProvisionedMeshNode> nodes = (await widget.meshManagerApi.meshNetwork!.nodes).skip(1).toList();
    ProvisionedMeshNode deviceNode = nodes.last;
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
