import 'package:example_nrf/pages/scene_device_page.dart';
import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/nrf_manager.dart';

class ScenePage extends StatefulWidget {
  const ScenePage({super.key});

  @override
  State<ScenePage> createState() => _SceneScenePageState();
}

class _SceneScenePageState extends State<ScenePage> {
  late final nrfManager = NrfManager();
  late final IMeshNetwork meshNetwork =
      NrfManager().meshManagerApi.meshNetwork!;
  late final meshManagerApi = NrfManager().meshManagerApi;
  late List<SceneData> scenes = [];
  bool loading = true;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadScenes();
    init();
  }

  void init()async{
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> _loadScenes() async {
    try {
      final sceneList = await meshNetwork.scenes() ?? [];
      setState(() {
        scenes = sceneList;
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('加载场景失败: $e'), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _recallScene(int sceneNumber) async {

    try {
      var tid = nrfManager.createSequenceNumber();
      var nodes = await meshNetwork.nodes;
      var address = await nodes[2].unicastAddress;
      var groupAddressStr = prefs.getStringList(sceneNumber.toString())?[0];
      if(groupAddressStr == null){
        return;
      }
      var groupAddress = int.parse(groupAddressStr);
      await meshManagerApi.sendSceneRecall(groupAddress, sceneNumber, tid);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('已切换到场景: $sceneNumber')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('切换失败: $e'), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _addScene() async {
    final nameController = TextEditingController();

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('添加场景'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: '场景名称'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, nameController.text.trim()),
            child: const Text('保存'),
          ),
        ],
      ),
    );

    final sceneName = result;
    if (sceneName == null || sceneName.isEmpty) return;

    try {
      var result = await meshNetwork.addScene(sceneName);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('添加成功: $sceneName')));

      _loadScenes();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('添加失败: $e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('场景控制')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: scenes.length,
              itemBuilder: (_, index) {
                final scene = scenes[index];
                return InkWell(
                  onTap: () => _jumpToSceneDevicePage(scene),
                  child: Card(
                    child: ListTile(
                      title: Text('Scene: ${scene.name}'),
                      subtitle: Text('编号: ${scene.number}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () => _recallScene(scene.number),
                            child: Text('切换'),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _removeScene(scene.number),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'add_scene',
        onPressed: _addScene,
        tooltip: '添加场景',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _jumpToSceneDevicePage(SceneData scene) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SceneDevicePage(scene)),
    ).then((v) {
      _loadScenes();
    });
    ;
  }

  void _removeScene(int sceneNumber) async{
    await meshNetwork.removeScene(sceneNumber);
    _loadScenes();
  }
}
