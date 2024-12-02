import 'dart:async';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

// Endcap types
const int BCON_ENDCAP_FORWARD = 0x81;
const int BCON_ENDCAP_AFT = 0x82;
const int BCON_ENDCAP_BOTH = 0x83;

// Light channel specifier bits
const int BCON_ENDCAP_TYPE_LIGHTS_ALL = 0x7F;
const int BCON_ENDCAP_TYPE_LIGHTS_HB_SWIR = 0x40;
const int BCON_ENDCAP_TYPE_LIGHTS_HB_NIR = 0x20;
const int BCON_ENDCAP_TYPE_LIGHTS_HB_RGBW = 0x10;
const int BCON_ENDCAP_TYPE_LIGHTS_LB_SWIR = 0x04;
const int BCON_ENDCAP_TYPE_LIGHTS_LB_NIR = 0x02;
const int BCON_ENDCAP_TYPE_LIGHTS_LB_RGB = 0x01;
const int LIGHT_CHANNEL_IR_MASK = BCON_ENDCAP_TYPE_LIGHTS_HB_SWIR |
    BCON_ENDCAP_TYPE_LIGHTS_HB_NIR |
    BCON_ENDCAP_TYPE_LIGHTS_LB_SWIR |
    BCON_ENDCAP_TYPE_LIGHTS_LB_NIR;

// Strobe types
const int BCON_STROBE_TYPE_BLINK = 0x84;
const int BCON_STROBE_TYPE_BLINK_PULSE = 0x85;
const int BCON_STROBE_TYPE_MORSE = 0x86;
const int BCON_STROBE_TYPE_MORSE_LOOP = 0x87;
const int BCON_STROBE_OFF = 0x88;

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
//   // RGB values ranging from 0 - 255
//   int _red = 0;
//   int _green = 0;
//   int _blue = 0;

// // Boolean variables for switches
//   bool _hbVisOn = false;
//   bool _lbVisOn = false;
//   bool _hbNirOn = false;
//   bool _lbNirOn = false;
//   bool _hbSwirOn = false;
//   bool _lbSwirOn = false;

//   // Dropdown pattern variable
//   int _strobePattern = 0;
//   final List<String> _patterns = ['Solid', 'Strobe', 'SOS', 'Message'];

// // Additional sliders for duty cycles ranging from 0 - 255
//   int _onDutyCycle = 0;
//   int _offDutyCycle = 0;

  bool _forwardCap = true;
  bool _aftCap = false;

  String _receivedSolidState = '';
  String _receivedStrobeState = '';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('Forward Cap:'),
                      Switch(
                        value: _forwardCap,
                        onChanged: (value) => setState(() {
                          _forwardCap = value;
                        }),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Aft Cap:'),
                      Switch(
                        value: _aftCap,
                        onChanged: (value) => setState(() {
                          _aftCap = value;
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              customMessageButton(hbRed, 'HB Red'),
              customMessageButton(hbbLbg, 'HB Blue, LB Green'),
              customMessageButton(hbMaxWhite, 'Max White'),
              customMessageButton(solidOff, 'Solid Off'),
              customMessageButton(getSolidState, 'Get Solid State'),
              customMessageButton(strobeBothRed, 'Strobe Both Red'),
              customMessageButton(strobeBothWhite, 'Strobe Both White'),
              customMessageButton(strobeOff, 'Strobe Off'),
              customMessageButton(getStrobeState, 'Get Strobe State'),
              customMessageButton(strobeMorse, 'Strobe Morse (Not implemented)'),
              Text(_receivedSolidState),
              Text(_receivedStrobeState),
            ],
          ),
        ),
      ],
    );
  }

  Widget customMessageButton(Function onPressed, String text) {
    return Row(
      // I can definitely parameterize these rows
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => onPressed(),
            child: Text(text),
          ),
        ),
      ],
    );
  }

  void insertEndcaps(List<int> data) {
    if (_forwardCap && _aftCap) {
      data.insert(0, BCON_ENDCAP_BOTH);
    } else if (_forwardCap) {
      data.insert(0, BCON_ENDCAP_FORWARD);
    } else {
      data.insert(0, BCON_ENDCAP_AFT);
    }
  }

  hbRed() {
    List<int> bconLightModelData = [];
    insertHex(bconLightModelData, '1080000000');
    insertEndcaps(bconLightModelData);
    debugPrint('$bconLightModelData');
    sendVendorModelMessage(bconLightModelData, opCode: 0x01);
  }

  hbbLbg() {
    List<int> bconLightModelData = [];
    insertHex(bconLightModelData, '10 00008000 01 00ff00');
    insertEndcaps(bconLightModelData);
    debugPrint('$bconLightModelData');
    sendVendorModelMessage(bconLightModelData, opCode: 0x01);
  }

  hbMaxWhite() {
    List<int> bconLightModelData = [];
    insertHex(bconLightModelData, '10 ffffffff');
    insertEndcaps(bconLightModelData);
    debugPrint('$bconLightModelData');
    sendVendorModelMessage(bconLightModelData, opCode: 0x01);
  }

  solidOff() {
    List<int> bconLightModelData = [];
    insertHex(bconLightModelData, '66001100000000');
    insertEndcaps(bconLightModelData);
    debugPrint('$bconLightModelData');
    sendVendorModelMessage(bconLightModelData, opCode: 0x01);
  }

  getSolidState() {
    List<int> bconLightModelData = [];
    insertEndcaps(bconLightModelData);
    sendVendorModelMessage(bconLightModelData, opCode: 0x02);
  }

  strobeBothRed() {
    List<int> bconLightModelData = [];
    insertHex(bconLightModelData, '1040000000 01ff0000 84ffff');
    insertEndcaps(bconLightModelData);
    debugPrint('$bconLightModelData');
    sendVendorModelMessage(bconLightModelData, opCode: 0x03);
  }

  strobeBothWhite() {
    List<int> bconLightModelData = [];
    insertHex(bconLightModelData, '1010101010 01ff8080 84ffff');
    insertEndcaps(bconLightModelData);
    debugPrint('$bconLightModelData');
    sendVendorModelMessage(bconLightModelData, opCode: 0x03);
  }

  strobeOff() {
    List<int> bconLightModelData = [];
    insertHex(bconLightModelData, '6600110000000088');
    insertEndcaps(bconLightModelData);
    debugPrint('$bconLightModelData');
    sendVendorModelMessage(bconLightModelData, opCode: 0x03);
  }

  strobeMorse() {
    List<int> bconLightModelData = [];
    insertHex(bconLightModelData,
        '1030313234 8780 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 30 31 32 33 34 35 36 37 38 39 00');
    insertEndcaps(bconLightModelData);
    debugPrint('$bconLightModelData');
    sendVendorModelMessage(bconLightModelData, opCode: 0x03);
  }

  getStrobeState() {
    List<int> bconLightModelData = [];
    insertEndcaps(bconLightModelData);
    sendVendorModelMessage(bconLightModelData, opCode: 0x04);
  }

  getBconLightState() {
    sendVendorModelMessage([], opCode: 0x12);
  }

  void sendVendorModelMessage(List<int> data, {int opCode = 0x01}) async {
    const modelId = 0x59000A; // 5832714onNetworkUpdated
    const companyIdentifier = 0x59; // 89

    // data.add(0x00); // null terminator

    Uint8List uint8Data = Uint8List.fromList(data);

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      var status = await widget.meshManagerApi
          .sendVendorModelMessage(
              widget.nodeAddress, modelId, companyIdentifier, opCode, uint8Data) // make company identifier not Nordic
          .timeout(const Duration(seconds: 5));

      scaffoldMessenger.clearSnackBars();

      // if (opCode != 0x12) {
      String hexMessage = uint8ListToHexString(status.message);
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('Received Hex: $hexMessage')));
      if (opCode == 0x02) {
        // get solid state
        setState(() {
          _receivedSolidState = parseSolidState(status.message);
        });
      }

      if (opCode == 0x04) {
        // get strobe state
        setState(() {
          _receivedStrobeState = parseStrobeState(status.message);
        });
      }
      // } else {
      //   String stateGetMessage = parseBconLightState(status.message);
      //   scaffoldMessenger.showSnackBar(SnackBar(content: Text("Received State:\n$stateGetMessage")));
      // }
    } on TimeoutException catch (_) {
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
    } on PlatformException catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}

String uint8ListToHexString(Uint8List bytes) {
  return bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join(' ').toUpperCase();
}

// When message received with opcode 0x02 (Solid lights Get), parse our first endcap specifier
String parseSolidState(Uint8List bytes) {
  int endcapSpecifier = bytes[3];
  String state = 'Solid Light State\n';

  if (endcapSpecifier == BCON_ENDCAP_FORWARD) {
    state += "=== Forward cap ===\n";
    state += "LB RGB: ${bytes[4]}, ${bytes[5]}, ${bytes[6]}\n";
    state += "LB NIR: ${bytes[7]}\n";
    state += "LB SWIR: ${bytes[8]}\n";
    state += "HB RGBW: ${bytes[9]}, ${bytes[10]}, ${bytes[11]}, ${bytes[12]}\n";
    state += "HB NIR: ${bytes[13]}\n";
    state += "HB SWIR: ${bytes[14]}\n";
  } else if (endcapSpecifier == BCON_ENDCAP_AFT) {
    state += "=== Aft cap ===\n";
    state += "LB RGB: ${bytes[4]}, ${bytes[5]}, ${bytes[6]}\n";
    state += "LB NIR: ${bytes[7]}\n";
    state += "LB SWIR: ${bytes[8]}\n";
    state += "HB RGBW: ${bytes[9]}, ${bytes[10]}, ${bytes[11]}, ${bytes[12]}\n";
    state += "HB NIR: ${bytes[13]}\n";
    state += "HB SWIR: ${bytes[14]}\n";
  }

  return state;
}

// When message received with opcode 0x04 (Strobe Get), parse our first endcap specifier
String parseStrobeState(Uint8List bytes) {
  int endcapSpecifier = bytes[3];
  String state = 'Strobe Light State\n';

  if (endcapSpecifier == BCON_ENDCAP_FORWARD) {
    state += "=== Forward cap ===\n";
  } else if (endcapSpecifier == BCON_ENDCAP_AFT) {
    state += "=== Aft cap ===\n";
  }
  state += "LB RGB: ${bytes[4]}, ${bytes[5]}, ${bytes[6]}\n";
  state += "LB NIR: ${bytes[7]}\n";
  state += "LB SWIR: ${bytes[8]}\n";
  state += "HB RGBW: ${bytes[9]}, ${bytes[10]}, ${bytes[11]}, ${bytes[12]}\n";
  state += "HB NIR: ${bytes[13]}\n";
  state += "HB SWIR: ${bytes[14]}\n";
  state += "Strobe type: ${bytes[15]}\n";
  state += "Strobe on time: ${bytes[16]}\n";
  state += "Strobe off time: ${bytes[17]}\n";
  state += "Strobe message: ${bytesToAsciiString(bytes, start: 18)}\n";

  return state;
}

String bytesToAsciiString(Uint8List bytes, {int start = 0}) {
  // Take a slice of bytes starting from 'start' to the end
  List<int> relevantBytes = bytes.sublist(start);

  // Convert each byte to an ASCII character and combine into a single string
  return String.fromCharCodes(relevantBytes);
}

insertHex(List<int> data, hexString) {
  // Ensure the hex string length is even
  hexString = hexString.replaceAll(" ", "");
  if (hexString.length % 2 != 0) {
    hexString = '0$hexString'; // Pad with a leading zero if necessary
  }

  for (int i = 0; i < hexString.length; i += 2) {
    // Parse each pair of characters as a single byte
    String byteString = hexString.substring(i, i + 2);
    int byte = int.parse(byteString, radix: 16);
    data.add(byte);
  }
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
