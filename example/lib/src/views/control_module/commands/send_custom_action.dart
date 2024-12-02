import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class SendCustomAction extends StatefulWidget {
  final MeshManagerApi meshManagerApi;

  const SendCustomAction({Key? key, required this.meshManagerApi}) : super(key: key);

  @override
  State<SendCustomAction> createState() => _SendCustomActionState();
}

class _SendCustomActionState extends State<SendCustomAction> {
  bool onOff = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: const ValueKey('module-send-custom-action-form'),
      title: const Text("Joseph's Custom Action"),
      initiallyExpanded: true,
      children: <Widget>[
        // TextField(
        //   key: const ValueKey('module-send-custom-action-for'),
        //   decoration: const InputDecoration(hintText: 'Element Address'),
        //   onChanged: (text) {
        //     setState(() {
        //       selectedElementAddress = int.tryParse(text);
        //     });
        //   },
        // ),
        // Checkbox(
        //   key: const ValueKey('module-send-generic-on-off-value'),
        //   value: onOff,
        //   onChanged: (value) {
        //     setState(() {
        //       onOff = value!;
        //     });
        //   },
        // ),
        TextButton(
          onPressed: () async {
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            debugPrint('[Joseph Debug] Doing the special action');

            try {
              // Joseph test stuff
              final int customTestResult = await widget.meshManagerApi.customTest();
              debugPrint('[Joseph Debug] Just completed customTest call');
              debugPrint('[Joseph Debug] Result is $customTestResult');

              final int keyResult = await widget.meshManagerApi.checkAppKey();
              debugPrint('[Joseph Debug] Just completed checkAppKey call');
              debugPrint('[Joseph Debug] Result is $keyResult');

              scaffoldMessenger.showSnackBar(const SnackBar(content: Text('OK')));
            } on TimeoutException catch (_) {
              scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
            } on PlatformException catch (e) {
              scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
            } catch (e) {
              scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
            }
          },
          child: const Text('Send it dude 🤘'),
        )
      ],
    );
  }
}
