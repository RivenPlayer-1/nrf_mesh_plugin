import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

// Old version with sliders

/// Card with all 11-12 pairs of sliders on it
class VendorModelCard extends StatefulWidget {
  final String uuid;
  final int nodeAddress;
  final List<ElementData> elements;
  final MeshManagerApi meshManagerApi;

  const VendorModelCard({
    Key? key,
    required this.meshManagerApi,
    required this.nodeAddress,
    required this.elements,
    required this.uuid,
  }) : super(key: key);

  @override
  State<VendorModelCard> createState() => _VendorModelCardState();
}

class _VendorModelCardState extends State<VendorModelCard> {
  // RGB values ranging from 0 - 255
  int _red = 0;
  int _green = 0;
  int _blue = 0;

// Boolean variables for switches
  bool _hbVisOn = false;
  bool _lbVisOn = false;
  bool _hbNirOn = false;
  bool _lbNirOn = false;
  bool _hbSwirOn = false;
  bool _lbSwirOn = false;

  // Dropdown pattern variable
  int _strobePattern = 0;
  final List<String> _patterns = ['Solid', 'Strobe', 'SOS', 'Message'];

// Additional sliders for duty cycles ranging from 0 - 255
  int _onDutyCycle = 0;
  int _offDutyCycle = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle cardStyle = const TextStyle(overflow: TextOverflow.ellipsis);

    return ExpansionTile(
        initiallyExpanded: true,

        // shape: const Border(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Node UUID: ${widget.uuid}', style: cardStyle),
            Text('Node address: ${widget.nodeAddress}'),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // RGB Sliders
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Red: $_red'),
                    Slider(
                      value: _red.toDouble(),
                      min: 0,
                      max: 255,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          _red = value.toInt();
                        });
                      },
                    ),
                    Text('Green: $_green'),
                    Slider(
                      value: _green.toDouble(),
                      min: 0,
                      max: 255,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          _green = value.toInt();
                        });
                      },
                    ),
                    Text('Blue: $_blue'),
                    Slider(
                      value: _blue.toDouble(),
                      min: 0,
                      max: 255,
                      activeColor: Colors.blue,
                      onChanged: (value) {
                        setState(() {
                          _blue = value.toInt();
                        });
                      },
                    ),
                  ],
                ),

                // Switches
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwitchListTile(
                      title: const Text('HB Visible On'),
                      value: _hbVisOn,
                      visualDensity: const VisualDensity(vertical: -4.0),
                      onChanged: (value) {
                        setState(() {
                          _hbVisOn = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('LB Visible On'),
                      value: _lbVisOn,
                      visualDensity: const VisualDensity(vertical: -4.0),
                      onChanged: (value) {
                        setState(() {
                          _lbVisOn = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('HB NIR On'),
                      value: _hbNirOn,
                      visualDensity: const VisualDensity(vertical: -4.0),
                      onChanged: (value) {
                        setState(() {
                          _hbNirOn = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('LB NIR On'),
                      value: _lbNirOn,
                      visualDensity: const VisualDensity(vertical: -4.0),
                      onChanged: (value) {
                        setState(() {
                          _lbNirOn = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('HB SWIR On'),
                      value: _hbSwirOn,
                      visualDensity: const VisualDensity(vertical: -4.0),
                      onChanged: (value) {
                        setState(() {
                          _hbSwirOn = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('LB SWIR On'),
                      value: _lbSwirOn,
                      visualDensity: const VisualDensity(vertical: -4.0),
                      onChanged: (value) {
                        setState(() {
                          _lbSwirOn = value;
                        });
                      },
                    ),
                  ],
                ),

                // Dropdown for patterns
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      const Text('Pattern: '),
                      DropdownButton<int>(
                        value: _strobePattern,
                        onChanged: (newValue) {
                          setState(() {
                            _strobePattern = newValue!;
                          });
                        },
                        items: [
                          for (int i = 0; i < _patterns.length; i++)
                            DropdownMenuItem<int>(value: i, child: Text('${_patterns[i]} ($i)'))
                        ],
                      ),
                    ],
                  ),
                ),

                // Additional Sliders for Duty Cycles
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('On Duty Cycle: $_onDutyCycle'),
                    Slider(
                      value: _onDutyCycle.toDouble(),
                      min: 0,
                      max: 255,
                      onChanged: (value) {
                        setState(() {
                          _onDutyCycle = value.toInt();
                        });
                      },
                    ),
                    Text('Off Duty Cycle: $_offDutyCycle'),
                    Slider(
                      value: _offDutyCycle.toDouble(),
                      min: 0,
                      max: 255,
                      onChanged: (value) {
                        setState(() {
                          _offDutyCycle = value.toInt();
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: combineAndSend, child: const Text('Send Same')),
                    ElevatedButton(onPressed: combineAndSendDifferent, child: const Text('Send Different')),
                    ElevatedButton(onPressed: getBconLightState, child: const Text('GET')),
                  ],
                ),
              ],
            ),
          ),
        ]);
  }

  List<int> combineData() {
    // Convert RGB values to bytes
    // We need 8 bytes initially: 3 for RGB, 1 for toggle bits, 3 for strobe type and duty cycles, and 1 for null.
    List<int> bconLightModelData = [];

    // Add RGB values
    bconLightModelData.add(_red);
    bconLightModelData.add(_green);
    bconLightModelData.add(_blue);

    // Combine boolean values into a single byte using bitwise operations
    int boolByte = 0;
    boolByte |= (_hbVisOn ? 1 : 0) << 0;
    boolByte |= (_lbVisOn ? 1 : 0) << 1;
    boolByte |= (_hbNirOn ? 1 : 0) << 2;
    boolByte |= (_lbNirOn ? 1 : 0) << 3;
    boolByte |= (_hbSwirOn ? 1 : 0) << 4;
    boolByte |= (_lbSwirOn ? 1 : 0) << 5;

    // Add the combined boolean byte to the data
    bconLightModelData.add(boolByte);

    // Add the strobe pattern
    bconLightModelData.add(_strobePattern);

    // Add duty cycle values (assuming 8 bits each)
    bconLightModelData.add(_onDutyCycle);
    bconLightModelData.add(_offDutyCycle);

    return bconLightModelData;
  }

  combineAndSend() {
    List<int> bconLightModelData = combineData();

    debugPrint('[BCON Light Model] ${ListToHexByte3AsBits(bconLightModelData)}');

    sendVendorModelMessage(bconLightModelData);
  }

  combineAndSendDifferent() {
    var data = combineData();
    List<int> bconLightModelData = [...data, ...data];

    debugPrint('[BCON Light Model] ${ListToHexByte3AsBits(bconLightModelData)}');

    sendVendorModelMessage(bconLightModelData, opCode: 0x11);
  }

  getBconLightState() {
    sendVendorModelMessage([], opCode: 0x12);
  }

  void sendVendorModelMessage(List<int> data, {int opCode = 0x10}) async {
    const modelId = 0x59000A; // 5832714onNetworkUpdated
    const companyIdentifier = 0x59; // 89

    data.add(0x00); // null terminator

    Uint8List uint8Data = Uint8List.fromList(data);

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      var status = await widget.meshManagerApi
          .sendVendorModelMessage(
              widget.nodeAddress, modelId, companyIdentifier, opCode, uint8Data) // fix company identifier
          .timeout(const Duration(seconds: 3)); // set time out to something better.

      scaffoldMessenger.clearSnackBars();

      if (opCode != 0x12) {
        String hexMessage = uint8ListToHex(status.message);
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Received Hex: $hexMessage')));
      } else {
        String stateGetMessage = parseBconLightState(status.message);
        scaffoldMessenger.showSnackBar(SnackBar(content: Text("Received State:\n$stateGetMessage")));
      }
    } on TimeoutException catch (_) {
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
    } on PlatformException catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}

String uint8ListToHex(Uint8List bytes) {
  return bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join(' ').toUpperCase();
}

String parseBconLightState(Uint8List bytes) {
  // First three bytes are not the data we want
  return "RGB1: ${bytes[3]}, ${bytes[4]}, ${bytes[5]} \nRGB2: ${bytes[6]}, ${bytes[7]}, ${bytes[8]}";
}

String ListToHexByte3AsBits(List<int> input) {
  if (input.length < 4) {
    return 'Input Uint8List must have a length of at least 4.';
  }

  StringBuffer result = StringBuffer();

  for (int i = 0; i < input.length; i++) {
    if (i == 3) {
      // Convert byte at index 3 to a string of bits
      String bits = input[i].toRadixString(2).padLeft(8, '0');
      result.write(bits);
    } else {
      // Convert byte to a 2-character hexadecimal string
      String hex = input[i].toRadixString(16).padLeft(2, '0').toUpperCase();
      result.write(hex);
    }

    // Add space between bytes except for the last one
    if (i != input.length - 1) {
      result.write(' ');
    }
  }

  return result.toString();
}
