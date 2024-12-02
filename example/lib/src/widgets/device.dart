import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class Device extends StatelessWidget {
  final DiscoveredDevice device;
  final VoidCallback? onTap;
  final VoidCallback? onIdentify;

  const Device({Key? key, required this.device, this.onTap, this.onIdentify}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${device.name}: ${device.id}'),
              TextButton(onPressed: onIdentify, child: const Text('Identify')),
            ],
          ),
        ),
      ),
    );
  }
}
