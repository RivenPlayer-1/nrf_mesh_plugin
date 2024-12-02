import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class SendGenericLevel extends StatefulWidget {
  final MeshManagerApi meshManagerApi;

  const SendGenericLevel({Key? key, required this.meshManagerApi}) : super(key: key);

  @override
  State<SendGenericLevel> createState() => _SendGenericLevelState();
}

class _SendGenericLevelState extends State<SendGenericLevel> {
  int? selectedElementAddress;

  int? selectedLevel;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: const ValueKey('module-send-generic-level-form'),
      title: const Text('Send a generic level set'),
      initiallyExpanded: false, // change this to have the form initially expanded
      children: <Widget>[
        TextField(
          key: const ValueKey('module-send-generic-level-address'),
          decoration: const InputDecoration(hintText: 'Element Address'),
          onChanged: (text) {
            try {
              selectedElementAddress = int.parse(text);
            } catch (e) {
              debugPrint("Could not parse text to int");
            }
          },
        ),
        TextField(
          key: const ValueKey('module-send-generic-level-value'),
          decoration: const InputDecoration(hintText: 'Level Value 0 - 100%'),
          onChanged: (text) {
            setState(() {
              try {
                int? percentage = int.tryParse(text);
                // range from -32768 to +32767
                selectedLevel = ((percentage! * 65355 / 100) - 32768).round();
              } catch (e) {
                debugPrint("Could not convert percentage to 32 bit level");
              }
            });
          },
        ),
        TextButton(
          onPressed: selectedLevel != null ? () => sendGenericLevelCommand(context) : null,
          child: const Text('Send level'),
        )
      ],
    );
  }

  Future<void> sendGenericLevelCommand(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    debugPrint('send level $selectedLevel% to $selectedElementAddress');
    try {
      await widget.meshManagerApi
          .sendGenericLevelSet(selectedElementAddress!, selectedLevel!)
          .timeout(const Duration(seconds: 40));
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('OK')));
    } on TimeoutException catch (_) {
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
    } on PlatformException catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
