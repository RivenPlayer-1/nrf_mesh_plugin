import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

import '../control_module/mesh_element.dart';

class Node extends StatefulWidget {
  final String name;
  final ProvisionedMeshNode node;
  final MeshManagerApi meshManagerApi;
  final VoidCallback onGoToProvisioning;

  const Node(
      {Key? key,
      required this.node,
      required this.meshManagerApi,
      required this.name,
      required this.onGoToProvisioning})
      : super(key: key);

  @override
  State<Node> createState() => _NodeState();
}

class _NodeState extends State<Node> {
  bool isLoading = true;
  late int nodeAddress;
  late List<ElementData> elements;
  late String nodename; //remove

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    nodeAddress = await widget.node.unicastAddress;
    elements = await widget.node.elements;
    nodename = await widget.node.name; //remove
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Text('Configuring...'),
        ],
      ),
    );
    if (!isLoading) {
      body = ListView(
        children: [
          Text('Node address: $nodeAddress'),
          Text('Node UUID: ${widget.node.uuid}'),
          Text('Nodename: $nodename'),
          ...[
            const Text('Elements :'),
            Column(
              children: <Widget>[
                ...elements.map((element) => MeshElement(element)).toList(),
              ],
            ),
          ],

          // Deprovision Node from Node screen (code from send_deprovisioning.dart)
          TextButton(
            onPressed: () async {
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              final node = await widget.meshManagerApi.meshNetwork!.getNode(elements[0].address);
              final nodes = await widget.meshManagerApi.meshNetwork!.nodes;
              try {
                final provisionedNode = nodes.firstWhere((element) => element.uuid == node!.uuid);
                await widget.meshManagerApi.deprovision(provisionedNode).timeout(const Duration(seconds: 40));
                scaffoldMessenger.showSnackBar(const SnackBar(content: Text('OK')));

                // Go back to provisioning tab if deprovisioning succeeds
                widget.onGoToProvisioning();
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              } on TimeoutException catch (_) {
                scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
              } on PlatformException catch (e) {
                scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
              } on StateError catch (_) {
                scaffoldMessenger.showSnackBar(const SnackBar(content: Text('No node found with this uuid')));
              } catch (e) {
                scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            child: const Text('Send node reset'),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: body,
    );
  }
}
