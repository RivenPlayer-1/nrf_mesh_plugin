import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class NodeCard extends StatefulWidget {
  final ProvisionedMeshNode node;
  final VoidCallback onTapCard;

  const NodeCard({super.key, required this.node, required this.onTapCard});

  @override
  State<NodeCard> createState() => _NodeCardState();
}

class _NodeCardState extends State<NodeCard> {
  late final ProvisionedMeshNode node = widget.node;
  late final IMeshNetwork meshNetwork;
  late final MeshManagerApi meshManagerApi;
  late String nodeName = "";
  late String nodeAddress = "";
  late List<int> subscriptionAddresses = [];

  @override
  void initState() {
    super.initState();
    widget.node.name.then((v) {
      setState(() {
        nodeName = v;
      });
    });
    widget.node.unicastAddress.then((v) {
      setState(() {
        nodeAddress = v.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text('节点名称: ${nodeName}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('地址: 0x$nodeAddress')],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: widget.onTapCard,
      ),
    );
  }
}
