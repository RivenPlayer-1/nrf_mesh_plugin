import 'package:example_nrf/util/nrf_manager.dart';
import 'package:example_nrf/util/scene_util.dart';
import 'package:example_nrf/widgets/node_card.dart';
import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class SceneDeviceEditPage extends StatefulWidget {
  final List<ProvisionedMeshNode> nodeList;
  final int sceneNumber;

  const SceneDeviceEditPage(this.nodeList, this.sceneNumber, {super.key});

  @override
  State<SceneDeviceEditPage> createState() => _SceneDeviceEditPageState();
}

class _SceneDeviceEditPageState extends State<SceneDeviceEditPage> {
  late MeshManagerApi meshManagerApi =
      NrfManager().nordicNrfMesh.meshManagerApi;
  late int onOffAddress;
  late int levelAddress;
  late int storeAddress;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.nodeList.length,
        itemBuilder: (ctx, index) {
          final node = widget.nodeList[index];

          return NodeCard(node: node, onTapCard: () => _editNode(node));
        },
      ),
    );
  }

  void _editNode(ProvisionedMeshNode node) async {
    SceneUtil.editNode(context, node, widget.sceneNumber);
  }

  Future<ElementData?> _findModel(
    List<ElementData> elements,
    int modelId,
  ) async {
    for (final element in elements) {
      for (final model in element.models) {
        if (model.modelId == modelId) return element;
      }
    }
    return null;
  }

  void _setLevel(int value) async {
    //32768-32767
    await meshManagerApi.sendGenericLevelSet(levelAddress, value);
  }

  void _setOnOff(bool on) async {
    await meshManagerApi.sendGenericOnOffSet(
      onOffAddress,
      on,
      NrfManager().createSequenceNumber(),
    );
  }
}
