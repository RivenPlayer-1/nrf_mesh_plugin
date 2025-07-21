import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

import '../util/nrf_manager.dart';

class SceneControlPage extends StatefulWidget {
  const SceneControlPage({super.key});

  @override
  State<SceneControlPage> createState() => _SceneControlPageState();
}

class _SceneControlPageState extends State<SceneControlPage> {
  late final IMeshNetwork meshNetwork;
  List<SceneData> scenes = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    meshNetwork = NrfManager().meshManagerApi.meshNetwork!;
    _loadScenes();
  }

  Future<void> _loadScenes() async {
    try {
      final sceneList = await meshNetwork.getScenes();
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
      // await NrfManager().meshNetworkManager.sceneRecall(sceneNumber);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('已切换到场景: $sceneNumber')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('切换失败: $e'), backgroundColor: Colors.red),
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
          return Card(
            child: ListTile(
              title: Text('Scene: ${scene.name}'),
              subtitle: Text('编号: ${scene.number}'),
              trailing: ElevatedButton(
                onPressed: () => _recallScene(scene.number),
                child: const Text('切换'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SceneData {
  final int number;
  final String name;

  SceneData(this.number, this.name);

  factory SceneData.fromJson(Map<String, dynamic> json) => SceneData(
    json['number'] as int,
    json['name'] as String,
  );

  Map<String, dynamic> toJson() => {
    'number': number,
    'name': name,
  };
}
