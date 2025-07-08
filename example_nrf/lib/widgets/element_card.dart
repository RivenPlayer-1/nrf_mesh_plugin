import 'dart:math';

import 'package:example_nrf/util/nrf_manager.dart';
import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class ElementCard extends StatefulWidget {
  final ProvisionedMeshNode node;
  final ElementData element;

  const ElementCard({Key? key, required this.element, required this.node})
    : super(key: key);

  @override
  State<ElementCard> createState() => _ElementCardState();
}

class _ElementCardState extends State<ElementCard> {
  double brightness = 50;

  bool get hasOnOff => widget.element.models.any((m) => m.modelId == 0x1000);

  bool get hasLightness =>
      widget.element.models.any((m) => m.modelId == 0x1300);

  late int elementAddress = widget.element.address;

  void _sendOnOff(bool isOn) async {
    var tid = NrfManager().createSequenceNumber();
    await NrfManager().meshManagerApi.sendGenericOnOffSet(
      elementAddress,
      isOn,
      tid,
    );
  }

  void _sendLightness(int value) async {
    //32768-32767
    final int level = (value * 65535 / 100).toInt() - 32768;
    final address = widget.element.address;
    // var tid = NrfManager().createSequenceNumber();
    await NrfManager().meshManagerApi.sendGenericLevelSet(address, level);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSequenceNumber();
  }

  @override
  void dispose() {
    super.dispose();
    // release();
  }

  Future<void> release() async {
    // await BleMeshManager().callbacks?.dispose();
    // debugPrint("call dispose");
  }

  void loadSequenceNumber() async {
    // sequenceNumber = await NrfManager().meshManagerApi.getSequenceNumber(widget.node);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionTile(
        title: Text(widget.element.name),
        subtitle: Text('地址: ${widget.element.address.toRadixString(4)}'),
        children: [
          if (hasOnOff)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _sendOnOff(true);
                  },
                  child: const Text('开'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _sendOnOff(false);
                  },
                  child: const Text('关'),
                ),
              ],
            ),
          if (hasLightness)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text('亮度: ${brightness.toInt()}'),
                  Slider(
                    value: brightness,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: brightness.toInt().toString(),
                    onChanged: (value) {
                      setState(() => brightness = value);
                    },
                    onChangeEnd: (value) {
                      _sendLightness(value.toInt());
                    },
                  ),
                ],
              ),
            ),
          const Divider(),
          ...widget.element.models.map(
            (model) => ListTile(
              title: Text(model.modelName),
              subtitle: Text('Model ID: ${model.modelId}'),
            ),
          ),
        ],
      ),
    );
  }
}
