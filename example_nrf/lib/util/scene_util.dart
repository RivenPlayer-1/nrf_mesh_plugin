import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

import 'nrf_manager.dart';

class SceneUtil {
  static void editNode(
    BuildContext context,
    ProvisionedMeshNode node,
    int sceneNumber,
  ) async {
    final MeshManagerApi meshManagerApi = NrfManager().meshManagerApi;
    final nodeAddress = await node.unicastAddress;
    final elements = await node.elements;
    final onOffModelElement = _findModel(
      elements,
      0x1000,
    ); // Generic OnOff Server
    final levelModelElement = _findModel(
      elements,
      0x1002,
    ); // Generic Level Server
    final sceneModelElement = _findModel(elements, 0x1204); // Scene Server
    var onOffAddress = onOffModelElement?.address ?? -1;
    var levelAddress = levelModelElement?.address ?? -1;
    var storeAddress = sceneModelElement?.address ?? -1;
    if (!context.mounted) {
      return;
    }
    if (onOffAddress == -1 || levelAddress == -1 || storeAddress == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('节点不支持必要的模型'), backgroundColor: Colors.red),
      );
      return;
    }

    bool on = true;
    int level = 0;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('编辑节点: ${node.name ?? node.uuid}'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                    title: const Text('开关'),
                    value: on,
                    onChanged: (value) {
                      setState(() => on = value);
                      setOnOff(meshManagerApi, on, onOffAddress);
                    },
                  ),
                  Row(
                    children: [
                      const Text('亮度'),
                      Expanded(
                        child: Slider(
                          value: level.toDouble(),
                          min: -32768,
                          max: 32767,
                          divisions: 20,
                          label: level.toString(),
                          onChanged: (v) {
                            setState(() => level = v.toInt());
                          },
                          onChangeEnd: (v) =>
                              setLevel(meshManagerApi, level, levelAddress),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                try {
                  await sceneStore(
                    NrfManager().meshManagerApi,
                    nodeAddress,
                    sceneNumber,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('设置并存储成功'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('发送失败: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }

  static ElementData? _findModel(List<ElementData> elements, int modelId) {
    for (final element in elements) {
      for (final model in element.models) {
        if (model.modelId == modelId) return element;
      }
    }
    return null;
  }

  static void setLevel(
    MeshManagerApi meshManagerApi,
    int value,
    int address,
  ) async {
    //32768-32767
    await meshManagerApi.sendGenericLevelSet(address, value);
  }

  static void setOnOff(
    MeshManagerApi meshManagerApi,
    bool on,
    int address,
  ) async {
    await meshManagerApi.sendGenericOnOffSet(
      address,
      on,
      NrfManager().createSequenceNumber(),
    );
  }

  static Future<void> sceneStore(
    MeshManagerApi meshManagerApi,
    int nodeAddress,
    int sceneNumber,
  ) async {
    await meshManagerApi.sendSceneStore(nodeAddress, sceneNumber);
  }
}
