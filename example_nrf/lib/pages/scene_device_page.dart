import 'package:example_nrf/pages/scene_device_edit_page.dart';
import 'package:example_nrf/util/nrf_manager.dart';
import 'package:example_nrf/util/scene_util.dart';
import 'package:example_nrf/widgets/node_card.dart';
import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SceneDevicePage extends StatefulWidget {
  final SceneData scene;

  const SceneDevicePage(this.scene, {super.key});

  @override
  State<SceneDevicePage> createState() => _SceneDevicePageState();
}

class _SceneDevicePageState extends State<SceneDevicePage> {
  late final NordicNrfMesh nordicNrfMesh = NrfManager().nordicNrfMesh;
  late final MeshManagerApi meshManagerApi = NrfManager().meshManagerApi;
  late final IMeshNetwork meshNetwork = meshManagerApi.meshNetwork!;
  late int sceneNum = widget.scene.number;

  List<ProvisionedMeshNode> matchedNodes = [];
  late List<ProvisionedMeshNode> disMatchedNodes = [];
  List<GroupData> availableGroups = [];
  GroupData? selectedGroup;
  late List<int> elementAddresses = [];

  bool loading = true;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    loadData();
  }



  Future<void> loadData() async {
    try {
      final nodes = await meshNetwork.nodes;
      availableGroups = await meshNetwork.groups;
      matchedNodes.clear();
      disMatchedNodes.clear();
      disMatchedNodes.addAll(nodes);
      for (final address in widget.scene.addresses) {
        for (final node in nodes) {
          final nodeAddress = await node.unicastAddress;
          if (nodeAddress == address) {
            matchedNodes.add(node);
            disMatchedNodes.remove(node);
          }
        }
      }
      init();
      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('加载失败: $e'), backgroundColor: Colors.red),
      );
    }
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
    var selectedGroupAddress = int.parse(
      prefs.getStringList(sceneNum.toString())?[0] ?? '0',
    );
    if(selectedGroupAddress != 0){
      selectedGroup = availableGroups.firstWhere(
        (element) => element.address == selectedGroupAddress,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('订阅场景 $sceneNum 的节点')),
      floatingActionButton: FloatingActionButton(
        heroTag: 'add_scene_node',
        onPressed: _jumpToAddSceneNodePage,
        tooltip: '添加场景',
        child: const Icon(Icons.add),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildGroupSelector(),
                const Divider(height: 1),
                Expanded(
                  child: matchedNodes.isEmpty
                      ? const Center(child: Text('无订阅该场景的节点'))
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: matchedNodes.length,
                          itemBuilder: (context, index) {
                            final node = matchedNodes[index];
                            return NodeCard(
                              node: node,
                              onTapCard: () => _editNode(node, sceneNum),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }

  Widget _buildGroupSelector() {
    return ListTile(
      title: const Text('群播地址'),
      subtitle: Text(selectedGroup?.name ?? '未选择'),
      trailing: ElevatedButton(
        onPressed: _showGroupSelectionDialog,
        child: const Text('选择群组'),
      ),
    );
  }

  void _showGroupSelectionDialog() async {
    if (availableGroups.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('无可用群组'), backgroundColor: Colors.orange),
      );
      return;
    }

    final selected = await showDialog<GroupData>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('选择群组'),
          children: availableGroups.map((group) {
            return SimpleDialogOption(
              onPressed: () => _bindGroupForAllNodes(group),
              child: Text(group.name),
            );
          }).toList(),
        );
      },
    );

    if (selected != null && selected != selectedGroup) {
      setState(() {
        selectedGroup = selected;
      });

      _subscribeGroupForAllNodes(selected);
    }
  }

  Future<void> _subscribeGroupForAllNodes(GroupData group) async {
    //todo 如果有失败的咋办？之前的node设置appKey也是如此
    for (final node in matchedNodes) {
      final elements = await node.elements;
      for (final element in elements) {
        for (final model in element.models) {
          if (model.modelId == 0x1203) {
            try {
              meshManagerApi.sendConfigModelSubscriptionAdd(
                element.address,
                group.address,
                model.modelId,
              );
            } catch (e) {
              print('订阅失败 ${node.uuid}: $e');
            }
          }
        }
      }
    }
    prefs.setStringList(sceneNum.toString(), [group.address.toString()]);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('已订阅至群组 ${group.name}')));
  }

  void _editNode(ProvisionedMeshNode node, int sceneNumber) {
    SceneUtil.editNode(context, node, sceneNumber);
  }

  void _jumpToAddSceneNodePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => SceneDeviceEditPage(disMatchedNodes, sceneNum),
      ),
    );
  }

  void _bindGroupForAllNodes(GroupData group) async {
    print("_bindGroupForAllNodes");
    Navigator.pop(context, group);
    // final resList = <ConfigModelSubscriptionStatus>[];
    // //todo 如果有失败的咋办？之前的node设置appKey也是如此
    // for (var elementAddresses in elementAddresses) {
    //   var res = await meshManagerApi.sendConfigModelSubscriptionAdd(
    //     elementAddresses,
    //     group.address,
    //     0x1203,
    //   );
    // }
    // prefs.setStringList(sceneNum.toString(),[group.address.toString()]);
  }
}
