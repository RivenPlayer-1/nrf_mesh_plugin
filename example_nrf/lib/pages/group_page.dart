import 'package:example_nrf/util/nrf_manager.dart';
import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class MeshGroup {
  final String name;
  final int address; // 通常从 0xC000 开始
  final List<String> elements; // 可换成真实 Element 类型

  MeshGroup({required this.name, required this.address, List<String>? elements})
    : elements = elements ?? [];
}

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  late IMeshNetwork? meshNetwork;
  final List<GroupData> _groups = <GroupData>[];
  int _groupAddressCounter = 0xC000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    meshNetwork = NrfManager().meshManagerApi.meshNetwork;
    if(meshNetwork == null){
      return;
    }
    loadGroup();
  }

  void loadGroup() async {
    final groups = await meshNetwork?.groups;
    if (groups == null) {
      return;
    }
    setState(() {
      _groups.clear();
      _groups.addAll(groups);
    });
  }

  void _addGroup() async {
    final nameController = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('创建新群组'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(hintText: '请输入群组名称'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () {
              createAndAddGroup(nameController.text);
            },
            child: const Text('创建'),
          ),
        ],
      ),
    );

    if (result != null) {
      loadGroup();
    }
  }

  void createAndAddGroup(String name) async {
    if (name.trim().isEmpty) return;
    var result = await meshNetwork?.addGroupWithName(name);
    if(result != null){
      setState(() {
        _groups.add(result);
      });
      if(mounted){
        Navigator.pop(context);
      }
    }
  }

  void _deleteGroup(int index) async{
    final address = _groups[index].address;
    var result = await meshNetwork?.removeGroup(address)?? false;
    if(!result){
      return;
    }
    setState(() {
      _groups.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('群组管理')),
      body: _groups.isEmpty
          ? const Center(child: Text('暂无群组，点击右下角按钮创建'))
          : ListView.builder(
              itemCount: _groups.length,
              itemBuilder: (context, index) {
                final group = _groups[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(group.name),
                    subtitle: Text(
                      '地址: 0x${group.address.toRadixString(16).toUpperCase()}\n'
                      // '包含元素: ${group.address}',
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => _deleteGroup(index),
                    ),
                    onTap: () {
                      // 这里可以跳转到群组控制页面或选择添加设备
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('点击了群组 ${group.name}')),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addGroup,
        child: const Icon(Icons.add),
        tooltip: '创建群组',
      ),
    );
  }
}
