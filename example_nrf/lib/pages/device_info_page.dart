import 'package:example_nrf/util/nrf_manager.dart';
import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class DeviceInfoPage extends StatefulWidget {
  final String deviceName;
  final ProvisionedMeshNode node;

  const DeviceInfoPage({Key? key, required this.deviceName, required this.node})
    : super(key: key);

  @override
  State<DeviceInfoPage> createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  bool _loading = true;
  late List<ElementData> _elements;
  late List<GroupData> _groups;
  late MeshManagerApi meshManagerApi = NrfManager().meshManagerApi;

  @override
  void initState() {
    super.initState();
    _loadElement();
    _loadGroups();
  }

  Future<void> _loadElement() async {
    try {
      _elements = await widget.node.elements;
      setState(() {
        _loading = false;
      });
    } catch (e) {
      print('加载节点失败: $e');
      setState(() => _loading = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('加载设备信息失败: $e')));
      }
    }
  }

  Future<void> _loadGroups() async {
    _groups = await NrfManager().meshManagerApi.meshNetwork?.groups ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.deviceName)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _elements.length,
              itemBuilder: (_, index) {
                final element = _elements[index];
                return _buildElementCard(element);
              },
            ),
    );
  }

  Widget _buildElementCard(ElementData element) {
    bool hasOnOff = element.models.any((m) => m.modelId == 0x1000);

    bool hasLightness = element.models.any((m) => m.modelId == 0x1300);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasOnOff)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _sendOnOff(element.address, true);
                    },
                    child: const Text('on'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _sendOnOff(element.address, false);
                    },
                    child: const Text('off'),
                  )
                ],
              ),
            const Divider(),

            Text(
              'Element: 0x${element.address.toRadixString(16)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...element.models.map((model) => _buildModelTile(model, element)),
          ],
        ),
      ),
    );
  }

  Widget _buildModelTile(ModelData model, ElementData element) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(model.modelName),
      subtitle: Text('Model ID: 0x${model.modelId.toRadixString(16)}'),
      trailing: IconButton(
        icon: const Icon(Icons.group_add),
        onPressed: () => _showGroupSubscriptionDialog(model, element.address),
      ),
    );
  }

  void _sendLightness(int elementAddress, int value) async {
    //32768-32767
    final int level = (value * 65535 / 100).toInt() - 32768;
    // var tid = NrfManager().createSequenceNumber();
    await meshManagerApi.sendGenericLevelSet(elementAddress, level);
  }

  void _sendOnOff(int elementAddress, bool isOn) async {
    var tid = NrfManager().createSequenceNumber();
    await meshManagerApi.sendGenericOnOffSet(elementAddress, isOn, tid);
  }

  Future<void> _showGroupSubscriptionDialog(
    ModelData model,
    int elementAddress,
  ) async {
    final subscribedAddresses = model.subscribedAddresses.toSet();

    final subscribedGroups = _groups
        .where((g) => subscribedAddresses.contains(g.address))
        .toList();
    final unsubscribedGroups = _groups
        .where((g) => !subscribedAddresses.contains(g.address))
        .toList();

    final selectedGroup = await showDialog<GroupData>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('订阅群组'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (subscribedGroups.isNotEmpty) ...[
                const Text(
                  '已订阅的群组',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...subscribedGroups.map(
                  (group) => ListTile(
                    title: Text(
                      '${group.name} (0x${group.address.toRadixString(16)})',
                    ),
                    trailing: const Chip(
                      label: Text('已订阅'),
                      backgroundColor: Colors.greenAccent,
                    ),
                    enabled: false,
                  ),
                ),
                const Divider(),
              ],
              if (unsubscribedGroups.isNotEmpty) ...[
                const Text(
                  '可订阅的群组',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...unsubscribedGroups.map(
                  (group) => ListTile(
                    title: Text(
                      '${group.name} (0x${group.address.toRadixString(16)})',
                    ),
                    onTap: () => Navigator.pop(context, group),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );

    if (selectedGroup != null) {
      var result = await meshManagerApi.sendConfigModelSubscriptionAdd(
        elementAddress,
        selectedGroup.address,
        model.modelId,
      );
      if (result.isSuccessful) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('订阅成功: ${selectedGroup.name}')));
        _loadElement();
      }else{
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('订阅失败: ${selectedGroup.name}')));
      }
    }
  }
}
