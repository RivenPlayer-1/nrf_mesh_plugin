import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

import '../util/nrf_manager.dart';

class GroupControlPage extends StatefulWidget {
  final GroupData group;

  const GroupControlPage(this.group, {super.key});

  @override
  State<GroupControlPage> createState() => _GroupControlPageState();
}

class _GroupControlPageState extends State<GroupControlPage> {
  late final group = widget.group;
  List<ModelData> models = [];
  List<ModelData> onOffModels = [];
  List<ModelData> levelModels = [];
  late IMeshNetwork meshNetwork;
  late MeshManagerApi meshManagerApi;

  @override
  void initState() {
    super.initState();
    meshManagerApi = NrfManager().meshManagerApi;
    meshNetwork = meshManagerApi.meshNetwork!;
    _loadData();
  }

  void _loadData() async {
    final allModels = await meshNetwork.getModels(group.address) ?? [];
    setState(() {
      models = allModels;
      onOffModels = allModels
          .where((m) => m.modelId == 0x1000)
          .toList(); // Generic OnOff Server
      levelModels = allModels
          .where((m) => m.modelId == 0x1002)
          .toList(); // Generic Level Server
    });
  }

  void _setOnOff(bool value) async {
    await meshManagerApi.sendGenericOnOffSet(
      group.address,
      value,
      NrfManager().createSequenceNumber(),
    );
  }

  void _setLevel(int level) async {
    await meshManagerApi.sendGenericLevelSet(group.address, level);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('groupControl - ${group.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (onOffModels.isNotEmpty) _buildOnOffCard(),
            const SizedBox(height: 16),
            if (levelModels.isNotEmpty) _buildLevelCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildOnOffCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '开关控制 (${onOffModels.length})',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _setOnOff(true),
                  child: const Text('开'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => _setOnOff(false),
                  child: const Text('关'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelCard() {
    int sliderValue = 0;
    return StatefulBuilder(
      builder: (context, setState) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '亮度控制 (${levelModels.length})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Slider(
                  min: -32768,
                  max: 32767,
                  value: sliderValue.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value.toInt();
                    });
                  },
                  onChangeEnd: (value) {
                    _setLevel(value.toInt());
                  },
                ),
                Text('当前亮度: $sliderValue'),
              ],
            ),
          ),
        );
      },
    );
  }
}
