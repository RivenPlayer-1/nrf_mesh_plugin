import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/bcon_sliders/bcon_slider_node.dart';

class BconSlidersScreen extends StatefulWidget {
  final NordicNrfMesh nordicNrfMesh;
  final MeshManagerApi meshManagerApi;
  // final VoidCallback onDisconnect;

  const BconSlidersScreen({
    Key? key,
    required this.nordicNrfMesh,
    required this.meshManagerApi,
  }) : super(key: key);

  @override
  State<BconSlidersScreen> createState() => _BconSlidersScreenState();
}

class _BconSlidersScreenState extends State<BconSlidersScreen> {
  final bleMeshManager = BleMeshManager();

  bool isLoading = true;
  late List<NodeDetails> nodeDetails = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _deinit();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, DeviceInfo> deviceMap = widget.meshManagerApi.meshNetwork!.deviceMap;
    // TextStyle cardStyle = const TextStyle(overflow: TextOverflow.ellipsis);
    Widget layout;

    layout = ListView(
      key: const ValueKey('listView'),
      physics: const AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        if (isLoading)
          const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                CircularProgressIndicator(),
                Text('Connecting to proxy node ...'),
                SizedBox(height: 20),
              ],
            ),
          ),
        for (var i = 0; i < nodeDetails.length; i++)
          Card(
              child: BconSliderNode(
            meshManagerApi: widget.meshManagerApi,
            nodeAddress: nodeDetails[i].unicastAddress,
            uuid: nodeDetails[i].uuid,
            elements: nodeDetails[i].elements,
          )),
      ],
    );

    return layout;
  }

  Future<void> _init() async {
    bleMeshManager.callbacks = DoozProvisionedBleMeshManagerCallbacks(widget.meshManagerApi, bleMeshManager);
    DiscoveredDevice? device;
    final completer = Completer<void>();
    widget.nordicNrfMesh.scanForProxy().listen((proxyDevice) async {
      device = proxyDevice;
      if (!completer.isCompleted) {
        completer.complete();
      }
    });

    // get nodes (ignore first node which is the default provisioner)
    var nodes = (await widget.meshManagerApi.meshNetwork!.nodes).skip(1).toList();
    // will bind app keys (needed to be able to configure node)
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
        }
      }
    }

    // Add node details to the list for rendering
    for (var node in nodes) {
      nodeDetails.add(NodeDetails(await node.unicastAddress, node.uuid, await node.elements));
    }
    setState(() {}); // update state and rebuil layout once nodes are loaded

    // Wait until the completer is completed, meaning the proxy device is assigned
    // Done down here so screen can still display nodes without being connected
    await completer.future;
    await bleMeshManager.connect(device!);

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _deinit() async {
    await bleMeshManager.disconnect();
    await bleMeshManager.callbacks!.dispose();
  }
}

class NodeDetails {
  final int unicastAddress;
  final String uuid;
  final List<ElementData> elements;

  NodeDetails(this.unicastAddress, this.uuid, this.elements);
}

// Mostly debugging stuff??
class DoozProvisionedBleMeshManagerCallbacks extends BleMeshManagerCallbacks {
  final MeshManagerApi meshManagerApi;
  final BleMeshManager bleMeshManager;

  late StreamSubscription<ConnectionStateUpdate> onDeviceConnectingSubscription;
  late StreamSubscription<ConnectionStateUpdate> onDeviceConnectedSubscription;
  late StreamSubscription<BleManagerCallbacksDiscoveredServices> onServicesDiscoveredSubscription;
  late StreamSubscription<DiscoveredDevice> onDeviceReadySubscription;
  late StreamSubscription<BleMeshManagerCallbacksDataReceived> onDataReceivedSubscription;
  late StreamSubscription<BleMeshManagerCallbacksDataSent> onDataSentSubscription;
  late StreamSubscription<ConnectionStateUpdate> onDeviceDisconnectingSubscription;
  late StreamSubscription<ConnectionStateUpdate> onDeviceDisconnectedSubscription;
  late StreamSubscription<List<int>> onMeshPduCreatedSubscription;

  DoozProvisionedBleMeshManagerCallbacks(this.meshManagerApi, this.bleMeshManager) {
    onDeviceConnectingSubscription = onDeviceConnecting.listen((event) {
      debugPrint('onDeviceConnecting $event');
    });
    onDeviceConnectedSubscription = onDeviceConnected.listen((event) {
      debugPrint('onDeviceConnected $event');
    });

    onServicesDiscoveredSubscription = onServicesDiscovered.listen((event) {
      debugPrint('onServicesDiscovered');
    });

    onDeviceReadySubscription = onDeviceReady.listen((event) async {
      debugPrint('onDeviceReady ${event.id}');
    });

    onDataReceivedSubscription = onDataReceived.listen((event) async {
      debugPrint('onDataReceived ${event.device.id} ${event.pdu} ${event.mtu}');
      await meshManagerApi.handleNotifications(event.mtu, event.pdu);
    });
    onDataSentSubscription = onDataSent.listen((event) async {
      debugPrint('onDataSent ${event.device.id} ${event.pdu} ${event.mtu}');
      await meshManagerApi.handleWriteCallbacks(event.mtu, event.pdu);
    });

    onDeviceDisconnectingSubscription = onDeviceDisconnecting.listen((event) {
      debugPrint('onDeviceDisconnecting $event');
    });
    onDeviceDisconnectedSubscription = onDeviceDisconnected.listen((event) {
      debugPrint('onDeviceDisconnected $event');
    });

    onMeshPduCreatedSubscription = meshManagerApi.onMeshPduCreated.listen((event) async {
      // debugPrint('onMeshPduCreated $event');
      await bleMeshManager.sendPdu(event);
    });
  }

  @override
  Future<void> dispose() => Future.wait([
        onDeviceConnectingSubscription.cancel(),
        onDeviceConnectedSubscription.cancel(),
        onServicesDiscoveredSubscription.cancel(),
        onDeviceReadySubscription.cancel(),
        onDataReceivedSubscription.cancel(),
        onDataSentSubscription.cancel(),
        onDeviceDisconnectingSubscription.cancel(),
        onDeviceDisconnectedSubscription.cancel(),
        onMeshPduCreatedSubscription.cancel(),
        super.dispose(),
      ]);

  @override
  Future<void> sendMtuToMeshManagerApi(int mtu) => meshManagerApi.setMtu(mtu);
}
