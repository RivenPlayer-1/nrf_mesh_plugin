import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class NrfManager {
  // 私有构造函数，防止外部实例化
  NrfManager._internal();

  // 静态单例实例
  static final NrfManager _instance = NrfManager._internal();

  // 工厂方法，提供全局访问点
  factory NrfManager() => _instance;

  final _nordicNrfMesh = NordicNrfMesh();

  NordicNrfMesh get nordicNrfMesh => _nordicNrfMesh;

  MeshManagerApi get meshManagerApi => _meshManagerApi;

  var isInit = false;

  //todo
  late IMeshNetwork? _meshNetwork;
  late final MeshManagerApi _meshManagerApi;
  late final StreamSubscription<IMeshNetwork?> onNetworkUpdateSubscription;
  late final StreamSubscription<IMeshNetwork?> onNetworkImportSubscription;
  late final StreamSubscription<IMeshNetwork?> onNetworkLoadingSubscription;

  Future<void> init() async {
    if (isInit) {
      return;
    }
    isInit = true;
    _meshManagerApi = _nordicNrfMesh.meshManagerApi;
    _meshNetwork = _meshManagerApi.meshNetwork;
    onNetworkUpdateSubscription = _meshManagerApi.onNetworkUpdated.listen((
      event,
    ) {
      _meshNetwork = event;
      print("onNetworkUpdated");
    });
    onNetworkImportSubscription = _meshManagerApi.onNetworkImported.listen((
      event,
    ) {
      _meshNetwork = event;
      print("onNetworkImported");
    });
    onNetworkLoadingSubscription = _meshManagerApi.onNetworkLoaded.listen((
      event,
    ) {
      _meshNetwork = event;
      print("onNetworkLoaded");
    });
    await meshManagerApi.loadMeshNetwork();
  }

  void dispose() async {
    Future.microtask(() async {
      onNetworkUpdateSubscription.cancel();
      onNetworkLoadingSubscription.cancel();
      onNetworkImportSubscription.cancel();
      meshManagerApi.dispose();
      await BleMeshManager().disconnect();
      await BleMeshManager().dispose();
    });
  }

  String getDeviceUuid(DiscoveredDevice device) {
    return Uuid.parse(
      _meshManagerApi.getDeviceUuid(
        device.serviceData[meshProvisioningUuid]!.toList(),
      ),
    ).toString();
  }

  int createSequenceNumber() => DateTime.now().millisecondsSinceEpoch % 256;
}

class DoozProvisionedBleMeshManagerCallbacks extends BleMeshManagerCallbacks {
  late MeshManagerApi meshManagerApi = NrfManager().meshManagerApi;
  late BleMeshManager bleMeshManager = BleMeshManager();

  late StreamSubscription<ConnectionStateUpdate> onDeviceConnectingSubscription;
  late StreamSubscription<ConnectionStateUpdate> onDeviceConnectedSubscription;
  late StreamSubscription<BleManagerCallbacksDiscoveredServices>
  onServicesDiscoveredSubscription;
  late StreamSubscription<DiscoveredDevice> onDeviceReadySubscription;
  late StreamSubscription<BleMeshManagerCallbacksDataReceived>
  onDataReceivedSubscription;
  late StreamSubscription<BleMeshManagerCallbacksDataSent>
  onDataSentSubscription;
  late StreamSubscription<ConnectionStateUpdate>
  onDeviceDisconnectingSubscription;
  late StreamSubscription<ConnectionStateUpdate>
  onDeviceDisconnectedSubscription;
  late StreamSubscription<List<int>> onMeshPduCreatedSubscription;

  var isConnected = false;

  DoozProvisionedBleMeshManagerCallbacks() {
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
      debugPrint('onDeviceReady name = ${event.name} id = ${event.id}');
      isConnected = true;
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
      isConnected = false;
    });

    onMeshPduCreatedSubscription = meshManagerApi.onMeshPduCreated.listen((
      event,
    ) async {
      debugPrint('onMeshPduCreated $event');
      await bleMeshManager.sendPdu(event);
      debugPrint('onMeshPduCreated done');
    });
  }

  @override
  Future<void> dispose() async {
    debugPrint('dooz dispose');
    await Future.wait([
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
  }

  @override
  Future<void> sendMtuToMeshManagerApi(int mtu) => meshManagerApi.setMtu(mtu);
}
