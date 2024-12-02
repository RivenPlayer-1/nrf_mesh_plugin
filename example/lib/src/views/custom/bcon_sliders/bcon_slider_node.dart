import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/bcon_sliders/bcon_slider_element.dart';

/// Card with all 11-12 pairs of sliders on it
class BconSliderNode extends StatefulWidget {
  final String uuid;
  final int nodeAddress;
  final List<ElementData> elements;
  final MeshManagerApi meshManagerApi;

  const BconSliderNode({
    Key? key,
    required this.meshManagerApi,
    required this.nodeAddress,
    required this.elements,
    required this.uuid,
  }) : super(key: key);

  @override
  State<BconSliderNode> createState() => _BconSliderNodeState();
}

class _BconSliderNodeState extends State<BconSliderNode> {
  bool highLowLink = false;
  late List<int> sliderValues;

  // Timer to prevent too many mesh messages
  Timer? _colorChangeTimer;

  final List<String> elementTitles = [
    "HB White LED", // 0
    "HB Red LED", // 1
    "HB Green LED", // 2
    "HB Blue LED", // 3
    "HB NIR LED", // 4
    "HB SWIR LED", // 5
    "LB Red LED", // 6
    "LB Green LED", // 7
    "LB Blue LED", // 8
    "LB NIR LED", // 9
    "LB SWIR LED", // 10
    "Strobe"
  ];

  @override
  initState() {
    super.initState();
    sliderValues = List<int>.filled(elementTitles.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, DeviceInfo> deviceMap = widget.meshManagerApi.meshNetwork!.deviceMap;
    TextStyle cardStyle = const TextStyle(overflow: TextOverflow.ellipsis);

    // Build BconSliderElement list
    List<Widget> bconSliderElementList = [];
    for (int i = 0; i < widget.elements.length; i++) {
      if (i >= widget.elements.length) {
        bconSliderElementList.add(BconSliderElement(null, sliderValues[i], elementTitles[i], widget.meshManagerApi,
            onChanged: (value) => updateSliderValue(value, i)));
      } else {
        bconSliderElementList.add(BconSliderElement(
            widget.elements[i], sliderValues[i], elementTitles[i], widget.meshManagerApi,
            onChanged: (value) => updateSliderValue(value, i)));
      }

      bconSliderElementList.add(const SizedBox(
        height: 10,
      ));
    }

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
          Center(
              child: Row(
            children: [
              const Text('Link High and Low Brightness '),
              Switch(
                  value: highLowLink,
                  onChanged: (newValue) {
                    setState(
                      () {
                        highLowLink = newValue;
                      },
                    );
                  }),
            ],
          )),
          ...[
            // All the individual slider boxes
            // Column(children: bconSliderElementList),
            Column(
              children: [
                for (int i = 0; i < sliderValues.length; i++)
                  if (i >= widget.elements.length)
                    BconSliderElement(null, sliderValues[i], elementTitles[i], widget.meshManagerApi,
                        onChanged: (value) => updateSliderValue(value, i))
                  else
                    BconSliderElement(widget.elements[i], sliderValues[i], elementTitles[i], widget.meshManagerApi,
                        onChanged: (value) => updateSliderValue(value, i)),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        ],
      ),
    );
  }

  void _sendTimeredGenericLevelCommands(List<int> indexes) {
    if (_colorChangeTimer == null || !_colorChangeTimer!.isActive) {
      // Start a new timer for 1/10 second
      _colorChangeTimer = Timer(const Duration(milliseconds: 100), () {
        _colorChangeTimer = null; // Reset the timer after it expires
        for (int index in indexes) {
          sendGenericLevelCommand(sliderValues[index], widget.elements[index].address);
        }
      });
    }
  }

  void updateSliderValue(int value, int index) {
    setState(() {
      sliderValues[index] = value;

      if (highLowLink) {
        // control both HB and LB from HB slider
        if (index >= 1 && index <= 5) {
          sliderValues[index + 5] = value;
          _sendTimeredGenericLevelCommands([index, index + 5]);
          // control both HB and LB from LB slider
        } else if (index >= 6) {
          sliderValues[index - 5] = value;
          _sendTimeredGenericLevelCommands([index, index - 5]);
          // control only HB when link toggle is on
        } else {
          _sendTimeredGenericLevelCommands([index]);
        }
        // control only the slider you are touching
      } else {
        _sendTimeredGenericLevelCommands([index, index]);
      }
    });
  }

  Future<void> sendGenericLevelCommand(int level, int address) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    debugPrint('send level 0x${level.toRadixString(16).toUpperCase()} to $address');
    try {
      await widget.meshManagerApi.sendGenericLevelSet(address, level - 32768).timeout(const Duration(seconds: 5));
    } on TimeoutException catch (_) {
      scaffoldMessenger.clearSnackBars();
      // scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond to set Level')));
    } on PlatformException catch (e) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
    } catch (e) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
