import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/node_controls/controllable_mesh_element.dart';

class ControllableNode extends StatefulWidget {
  final String uuid;
  final int nodeAddress;
  final List<ElementData> elements;
  final MeshManagerApi meshManagerApi;

  const ControllableNode({
    Key? key,
    required this.meshManagerApi,
    required this.nodeAddress,
    required this.elements,
    required this.uuid,
  }) : super(key: key);

  @override
  State<ControllableNode> createState() => _ControllableNodeState();
}

class _ControllableNodeState extends State<ControllableNode> {
  @override
  Widget build(BuildContext context) {
    Map<String, DeviceInfo> deviceMap = widget.meshManagerApi.meshNetwork!.deviceMap;
    TextStyle cardStyle = const TextStyle(overflow: TextOverflow.ellipsis);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (deviceMap[widget.uuid] != null) ...[
            Text(
              'Device Name: ${deviceMap[widget.uuid]?.deviceName}',
              style: cardStyle,
            ),
            Text(
              'Device Id: ${deviceMap[widget.uuid]?.deviceId}',
              style: cardStyle,
            ),
          ],
          Text(
            'Node UUID: ${widget.uuid}',
            style: cardStyle,
          ),
          Text('Node address: ${widget.nodeAddress}'),
          ...[
            const Text('Elements :'),
            Column(
              children: <Widget>[
                ...widget.elements.map((element) => ControllableMeshElement(element, widget.meshManagerApi)).toList(),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
