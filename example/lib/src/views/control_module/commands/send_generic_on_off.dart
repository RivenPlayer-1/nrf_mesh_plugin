import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class SendGenericOnOff extends StatefulWidget {
  final MeshManagerApi meshManagerApi;

  const SendGenericOnOff({Key? key, required this.meshManagerApi}) : super(key: key);

  @override
  State<SendGenericOnOff> createState() => _SendGenericOnOffState();
}

class _SendGenericOnOffState extends State<SendGenericOnOff> {
  int? selectedElementAddress;

  bool onOff = true;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: const ValueKey('module-send-generic-on-off-form'),
      title: const Text('Send a generic On Off set'),
      children: <Widget>[
        TextField(
          key: const ValueKey('module-send-generic-on-off-address'),
          decoration: const InputDecoration(hintText: 'Element Address'),
          onChanged: (text) {
            setState(() {
              selectedElementAddress = int.tryParse(text);
            });
          },
        ),
        Checkbox(
          key: const ValueKey('module-send-generic-on-off-value'),
          value: onOff,
          onChanged: (value) {
            setState(() {
              onOff = value!;
            });
          },
        ),
        TextButton(
          onPressed: selectedElementAddress != null ? () => sendGenericOnOffCommand(context) : null,
          child: const Text('Send on off'),
        )
      ],
    );
  }

  // Extracted so I can copy/paste/modify at will
  Future<void> sendGenericOnOffCommand(BuildContext context) async {
    {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      debugPrint('send level $onOff to $selectedElementAddress');
      final provisionerUuid = await widget.meshManagerApi.meshNetwork!.selectedProvisionerUuid();
      final nodes = await widget.meshManagerApi.meshNetwork!.nodes;
      try {
        final provisionedNode = nodes.firstWhere((element) => element.uuid == provisionerUuid);
        final sequenceNumber = await widget.meshManagerApi.getSequenceNumber(provisionedNode);

        // result.presentState gives what the light's state is
        var result = await widget.meshManagerApi
            .sendGenericOnOffSet(selectedElementAddress!, onOff, sequenceNumber)
            .timeout(const Duration(seconds: 3)); // originally set to 40 which is probably more reasonable

        // I assume that the "sendGenericOnOffSet" -> { in DoozMeshManagerApi.kt gets an Ack from the board
        // before it runs the result.success(null) but I don't know a good way to tell
        scaffoldMessenger.clearSnackBars();
        scaffoldMessenger
            .showSnackBar(SnackBar(content: Text('OK. Light is now ${result.presentState ? 'on' : 'off'}')));
      } on TimeoutException catch (_) {
        scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
      } on StateError catch (_) {
        scaffoldMessenger
            .showSnackBar(SnackBar(content: Text('No provisioner found with this uuid : $provisionerUuid')));
      } on PlatformException catch (e) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
      } catch (e) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }
}
