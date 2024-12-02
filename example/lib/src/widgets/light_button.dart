import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class LightButton extends StatefulWidget {
  final int index;
  final int address;
  final MeshManagerApi meshManagerApi;

  // const LightButton({Key? key, required this.service, required this.index})
  const LightButton({Key? key, required this.index, required this.address, required this.meshManagerApi})
      : super(key: key);

  @override
  State<LightButton> createState() => _LightButtonState();
}

class _LightButtonState extends State<LightButton> {
  bool _value = false;

  // variables for controls
  // final int numButtons = 4;
  final yellow = Colors.yellow;
  final black = Colors.black;
  late Color _currentColor = black;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          sendGenericOnOffCommand(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _currentColor == yellow ? Icons.lightbulb : Icons.lightbulb_outline,
              color: _currentColor,
              size: 50,
              shadows: _currentColor == yellow ? [const Shadow(color: Colors.orange, blurRadius: 10)] : [],
            ),
            Text(
              'LED ${widget.index + 1}',
            ),
            Text(
              'Address: ${widget.address}',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  } // buildLightButton

// Copy of sendGenericOnOffCommand from send_generic_on_off.dart
  Future<void> sendGenericOnOffCommand(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    debugPrint('send level ${!_value} to ${widget.address}');
    final provisionerUuid = await widget.meshManagerApi.meshNetwork!.selectedProvisionerUuid();
    final nodes = await widget.meshManagerApi.meshNetwork!.nodes;
    try {
      final provisionedNode = nodes.firstWhere((element) => element.uuid == provisionerUuid);
      final sequenceNumber = await widget.meshManagerApi.getSequenceNumber(provisionedNode);

      await widget.meshManagerApi
          .sendGenericOnOffSet(widget.address, !_value, sequenceNumber)
          .timeout(const Duration(seconds: 5)); // originally set to 40 which is probably more reasonable
      setState(() {
        // State is only set if the transaction succeeds
        _value = !_value;
        _currentColor = _value ? yellow : black;
      });
    } on TimeoutException catch (_) {
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
    } on StateError catch (_) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('No provisioner found with this uuid : $provisionerUuid')));
    } on PlatformException catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
