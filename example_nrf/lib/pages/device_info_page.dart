import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

import '../widgets/element_card.dart';

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

  @override
  void initState() {
    super.initState();
    _loadElement();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deviceName),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _elements.length,
              itemBuilder: (_, index) {
                final element = _elements[index];
                return ElementCard(node: widget.node, element: element);
              },
            ),
    );
  }
}
