import 'package:example_nrf/pages/scene_device_edit_page.dart';
import 'package:example_nrf/util/nrf_manager.dart';
import 'package:example_nrf/util/scene_util.dart';
import 'package:example_nrf/widgets/node_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class SceneDevicePage extends StatefulWidget {
  final int sceneNum;

  const SceneDevicePage(this.sceneNum, {super.key});

  @override
  State<SceneDevicePage> createState() => _SceneDevicePageState();
}

class _SceneDevicePageState extends State<SceneDevicePage> {
  late final NordicNrfMesh nordicNrfMesh = NrfManager().nordicNrfMesh;
  late final MeshManagerApi meshManagerApi = NrfManager().meshManagerApi;
  late final IMeshNetwork meshNetwork =
      NrfManager().meshManagerApi.meshNetwork!;

  List<ProvisionedMeshNode> matchedNodes = [];
  bool loading = true;
  late List<ProvisionedMeshNode> disMatchedNodes = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final nodes = await meshNetwork.nodes;
      final List<ProvisionedMeshNode> matchNodes = [];
      disMatchedNodes.addAll(nodes);
      for (final node in nodes) {
        try {
          final elements = await node.elements;
          for (final element in elements) {
            for (final meshModel in element.models) {
              // 0x1203 是 Scene Server
              if (meshModel.modelId == 0x1203) {
                if (meshModel.sceneNumbers != null) {
                  for (final sceneNum in meshModel.sceneNumbers!) {
                    if (sceneNum == widget.sceneNum) {
                      matchNodes.add(node);
                      disMatchedNodes.remove(node);
                      break;
                    }
                  }
                }
              }
            }
          }
        } catch (e) {
          print('Error fetching elements for node: $e');
        }
      }

      setState(() {
        matchedNodes = matchNodes;
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('加载节点失败: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('订阅场景 ${widget.sceneNum} 的节点')),
      floatingActionButton: FloatingActionButton(
        heroTag: 'add_scene_node',
        onPressed: _jumpToAddSceneNodePage,
        tooltip: '添加场景',
        child: const Icon(Icons.add),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : matchedNodes.isEmpty
          ? const Center(child: Text('无订阅该场景的节点'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: matchedNodes.length,
              itemBuilder: (context, index) {
                final node = matchedNodes[index];
                return NodeCard(
                  node: node,
                  onTapCard: () => _editNode(node, widget.sceneNum),
                );
              },
            ),
    );
  }

  void _editNode(ProvisionedMeshNode node, int sceneNumber) {
    SceneUtil.editNode(context, node, sceneNumber);
  }

  void _jumpToAddSceneNodePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => SceneDeviceEditPage(disMatchedNodes, widget.sceneNum),
      ),
    );
  }
}
