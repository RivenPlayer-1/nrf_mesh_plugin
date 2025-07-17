import 'dart:async';

import 'package:example_nrf/pages/device_info_page.dart';
import 'package:example_nrf/pages/scan_page.dart';
import 'package:example_nrf/util/nrf_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:permission_handler/permission_handler.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DevicePageState();
  }
}

class _DevicePageState extends State<DevicePage>
    with AutomaticKeepAliveClientMixin {
  late NordicNrfMesh nordicNrfMesh;
  late List<ProvisionedMeshNode> provisionedMeshNodes = [];
  late List<DiscoveredDevice> discoveredDevices = [];
  late StreamSubscription<DiscoveredDevice> _scanResults;
  var isScanning = false;
  var isConnecting = false;

  @override
  void initState() {
    super.initState();
    checkAndAskPermissions();
  }

  @override
  void dispose() {
    super.dispose();
    NrfManager().dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text('设备管理')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _jumpToScanPage(),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async => _startScan(),
        child: Stack(
          children: [
            discoveredDevices.isEmpty
                ? Center(
                    child: InkWell(onTap: _startScan, child: Text('暂无数据')),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) => _buildDeviceItem(index),
                    itemCount: discoveredDevices.length,
                  ),
            isScanning
                ? Center(child: CircularProgressIndicator())
                : SizedBox(),
            isConnecting ? Center(child: Text("connecting")) : SizedBox(),
          ],
        ),
      ),
    );
  }

  void checkAndAskPermissions() async {
    await Permission.bluetoothScan.request();
    await Permission.bluetoothConnect.request();
    await NrfManager().init();
    initListener();
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        _startScan();
      }
    });
  }

  void _jumpToScanPage() async {
    await _stopScan();
    await disconnectDevice();
    if (!mounted) {
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => ScanPage()));
  }

  Future<void> disconnectDevice() async {
    final connectDevice = BleMeshManager().device;
    if (connectDevice != null) {
      debugPrint("disconnect callback end");
      debugPrint("disconnect device start");
      await BleMeshManager().disconnect();
      await BleMeshManager().callbacks?.dispose();
      debugPrint("disconnect device end");
    }
  }

  void initListener() async {
    nordicNrfMesh = NrfManager().nordicNrfMesh;
    nordicNrfMesh.meshManagerApi.meshNetwork?.nodes.then((nodes) {
      provisionedMeshNodes.clear();
      setState(() {
        final provisionedNodes = nodes.skip(1);
        provisionedMeshNodes.addAll(provisionedNodes);
      });
    });
  }

  void _startScan() async {
    if (isScanning) {
      return;
    }
    setState(() {
      isScanning = true;
    });
    discoveredDevices.clear();
    _scanResults = nordicNrfMesh.scanForProxy().listen((
      discoveredDevice,
    ) async {
      final serviceData = discoveredDevice.serviceData[meshProxyUuid];
      if (serviceData == null) {
        return;
      }
      var isMatch = await nordicNrfMesh.meshManagerApi.networkIdMatches(
        serviceData,
      );
      // if (!isMatch) {
      //   return;
      // }
      var isExist = false;
      for (var device in discoveredDevices) {
        if (device.id == discoveredDevice.id) {
          device = discoveredDevice;
          isExist = true;
          break;
        }
      }
      if (isExist) {
        return;
      }
      if (mounted) {
        setState(() {
          discoveredDevices.add(discoveredDevice);
        });
      }
      debugPrint("discoveredDevice name = ${discoveredDevice.name}");
      debugPrint("discoveredDevice id = ${discoveredDevice.id}");
    });

    Future.delayed(Duration(seconds: 3), () {
      _stopScan();
    });
  }

  Future<void> _stopScan() async {
    await _scanResults.cancel();
    setState(() {
      if (mounted) {
        isScanning = false;
      }
    });
  }

  void connectDevice(int index) async {
    if (isConnecting) {
      return;
    }
    setState(() {
      isConnecting = true;
    });
    var selectDevice = discoveredDevices[index];

    var connectedDevice = BleMeshManager().device;
    var callbacks = BleMeshManager().callbacks;
    //todo
    if (callbacks == null) {
      BleMeshManager().callbacks = DoozProvisionedBleMeshManagerCallbacks();
      print("callback is null");
    } else if (callbacks is! DoozProvisionedBleMeshManagerCallbacks) {
      BleMeshManager().callbacks = DoozProvisionedBleMeshManagerCallbacks();
      print("callback is not DoozProvisionedBleMeshManagerCallbacks");
    }
    debugPrint("connected device = $connectedDevice");
    if (connectedDevice != null) {
      var isMatch = false;
      for (final device in discoveredDevices) {
        if (device.id == connectedDevice.id) {
          isMatch = true;
          print("match device");
          break;
        }
      }
      if (!isMatch) {
        print("not match device");
        await BleMeshManager().disconnect();
        await BleMeshManager().connect(selectDevice);
      }
    } else {
      await BleMeshManager().connect(selectDevice);
    }
    debugPrint("connect success");
    var selectNode = await bindModelWithKey(selectDevice);
    setState(() {
      isConnecting = false;
    });

    if (!mounted || selectNode == null) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) =>
            DeviceInfoPage(deviceName: selectDevice.name, node: selectNode),
      ),
    );
  }

  Future<ProvisionedMeshNode?> bindModelWithKey(DiscoveredDevice device) async {
    // will bind app keys (needed to be able to configure node)
    var selectNode = await matchProvisionedNode(device);
    if (selectNode == null) {
      print("not match node");
      return null;
    }
    final elements = await selectNode.elements;
    final unicast = await selectNode.unicastAddress;
    for (final element in elements) {
      for (final model in element.models) {
        if (model.boundAppKey.isEmpty) {
          if (element == elements.first && model == element.models.first) {
            continue;
          }
          await nordicNrfMesh.meshManagerApi.sendConfigModelAppBind(
            unicast,
            element.address,
            model.modelId,
          );
          await Future.delayed(Duration(microseconds: 100));
        }
      }
    }

    debugPrint("bind key success");
    return selectNode;
  }

  Future<ProvisionedMeshNode?> matchProvisionedNode(
    DiscoveredDevice device,
  ) async {
    var nodes = (await nordicNrfMesh.meshManagerApi.meshNetwork!.nodes)
        .skip(1)
        .toList();
    ProvisionedMeshNode? selectNode;
    debugPrint("device name = ${device.name}");
    for (final node in nodes) {
      final name = await node.name;
      debugPrint("check node name = $name ");
      if (name == device.name) {
        selectNode = node;
        break;
      }
      // 其他设备离线，会导致sendConfigModelAppBind卡主
    }
    return selectNode;
  }

  Widget _buildDeviceItem(int index) {
    return Dismissible(
      key: Key(discoveredDevices[index].id),
      // 每个设备的唯一标识作为 key
      direction: DismissDirection.endToStart,
      // 只允许从右向左滑动
      confirmDismiss: (direction) => _deleteDevice(index),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.0),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        child: InkWell(
          onTap: () => connectDevice(index),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(discoveredDevices[index].id),
          ),
        ),
      ),
    );
  }

  Future<bool> _deleteDevice(int index) async {
    var selectNode = await matchProvisionedNode(discoveredDevices[index]);
    if (selectNode == null) {
      print("no match node");
      return false;
    }
    var result = await nordicNrfMesh.meshManagerApi.deprovision(selectNode);
    if (result.success) {
      setState(() {
        discoveredDevices.removeAt(index);
      });
    }
    return result.success;
  }

  @override
  bool get wantKeepAlive => true;
}

typedef FutureGenerator<T> = Future<T> Function();

Future<T> retry<T>(int retries, FutureGenerator aFuture) async {
  try {
    return await aFuture();
  } catch (e) {
    if (retries > 1) {
      return retry(retries - 1, aFuture);
    }

    rethrow;
  }
}
