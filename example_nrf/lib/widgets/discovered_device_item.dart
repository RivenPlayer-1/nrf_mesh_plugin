import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class DiscoveredDeviceItem extends StatelessWidget {
  final DiscoveredDevice device;
  final VoidCallback? onIdentify;
  final VoidCallback? onProvisioning;

  const DiscoveredDeviceItem({
    super.key,
    required this.device,
    this.onIdentify,
    this.onProvisioning
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${device.name}: ${device.id}'),
              TextButton(onPressed: onIdentify,style:ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)), child: const Text('Identify'),),
              TextButton(onPressed: onProvisioning, style:ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)), child: const Text('Provisioning'))
            ],
          ),
        ),
      ),
    );
  }
}
