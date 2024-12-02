import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/control_module/commands/send_config_model_publication_add.dart';
import 'package:nordic_nrf_mesh_example/src/views/control_module/commands/send_generic_location.dart';
import 'package:nordic_nrf_mesh_example/src/views/control_module/commands/send_vendor_model_message.dart';

import 'commands/send_deprovisioning.dart';
import 'commands/send_generic_on_off.dart';
import 'commands/send_config_model_subscription_add.dart';
import 'commands/send_generic_level.dart';
import 'node.dart';

class Module extends StatefulWidget {
  final DiscoveredDevice device;
  final MeshManagerApi meshManagerApi;
  final VoidCallback onGoToProvisioning;
  final VoidCallback onDisconnect;

  const Module({
    Key? key,
    required this.device,
    required this.meshManagerApi,
    required this.onGoToProvisioning,
    required this.onDisconnect,
  }) : super(key: key);

  @override
  State<Module> createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  final bleMeshManager = BleMeshManager();

  bool isLoading = true;
  late List<ProvisionedMeshNode> nodes;

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
    Map<String, DeviceInfo> deviceMap = widget.meshManagerApi.meshNetwork!.deviceMap;
    TextStyle cardStyle = const TextStyle(overflow: TextOverflow.ellipsis);

    Widget layout = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Text('Connecting ...'),
        ],
      ),
    );
    if (!isLoading) {
      layout = ListView(
        children: <Widget>[
          for (var i = 0; i < nodes.length; i++)
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Node(
                        meshManagerApi: widget.meshManagerApi,
                        node: nodes[i],
                        name: nodes[i].uuid,
                        onGoToProvisioning: widget.onGoToProvisioning,
                      );
                    },
                  ),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    key: ValueKey('node-$i'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (deviceMap[nodes[i].uuid] != null) ...[
                          Text(
                            'Device Name: ${deviceMap[nodes[i].uuid]?.deviceName}',
                            style: cardStyle,
                          ),
                          Text(
                            'Device Id: ${deviceMap[nodes[i].uuid]?.deviceId}',
                            style: cardStyle,
                          ),
                        ],
                        Text(
                          'Node UUID: ${nodes[i].uuid}',
                          style: cardStyle,
                        ),

                        // Text(
                        //   'Primary Element Address: ${await nodes[i].unicastAddress}',
                        //   style: cardStyle,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          TextButton(
            onPressed: () {
              _deinit();
              widget.onDisconnect();
            },
            child: const Text('Disconnect from network'),
          ),

          const Divider(),
          // SendCustomAction(meshManagerApi: widget.meshManagerApi),
          SendGenericLocation(widget.meshManagerApi),
          SendVendorModelMessage(widget.meshManagerApi),
          SendGenericLevel(meshManagerApi: widget.meshManagerApi),
          SendGenericOnOff(meshManagerApi: widget.meshManagerApi),

          SendConfigModelSubscriptionAdd(widget.meshManagerApi),
          SendConfigModelPublicationAdd(widget.meshManagerApi),
          SendDeprovisioning(meshManagerApi: widget.meshManagerApi),
        ],
      );
    }
    return layout;
  }

  Future<void> _init() async {
    bleMeshManager.callbacks = DoozProvisionedBleMeshManagerCallbacks(widget.meshManagerApi, bleMeshManager);
    await bleMeshManager.connect(widget.device); // vital but can send commands to any device
    // await bleMeshManager.connect()
    // get nodes (ignore first node which is the default provisioner)
    nodes = (await widget.meshManagerApi.meshNetwork!.nodes).skip(1).toList();
    // will bind app keys (needed to be able to configure node)
    for (final node in nodes) {
      final elements = await node.elements;
      for (final element in elements) {
        for (final model in element.models) {
          if (model.boundAppKey.isEmpty) {
            if (element == elements.first && model == element.models.first) {
              continue;
            }
            final unicast = await node.unicastAddress;
            await widget.meshManagerApi.sendConfigModelAppBind(
              unicast,
              element.address,
              model.modelId,
            );
          }
        }
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  void _deinit() async {
    await bleMeshManager.disconnect();
    await bleMeshManager.callbacks!.dispose();
  }
}

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
      debugPrint('onMeshPduCreated $event');
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
