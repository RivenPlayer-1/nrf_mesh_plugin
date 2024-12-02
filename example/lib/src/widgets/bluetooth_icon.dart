import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/custom_screen.dart';

class BluetoothIcon extends StatefulWidget {
  final BconConnectionState connection;

  const BluetoothIcon({Key? key, required this.connection}) : super(key: key);

  @override
  BluetoothIconState createState() => BluetoothIconState();
}

class BluetoothIconState extends State<BluetoothIcon> {
  bool _showSearchingIcon = true;
  Timer? _timer;
  Color? _lastKnownColor;

  @override
  void initState() {
    super.initState();
    _startFlashing();
  }

  @override
  void didUpdateWidget(BluetoothIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.connection != widget.connection) {
      _startFlashing();
    }
  }

  void _startFlashing() {
    _timer?.cancel(); // Cancel any existing timer
    if (widget.connection == BconConnectionState.connecting) {
      _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
        setState(() {
          _showSearchingIcon = !_showSearchingIcon;
        });
      });
    } else {
      _timer?.cancel();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget icon;
    Color iconColor;

    if (widget.connection == BconConnectionState.connected) {
      iconColor = Colors.blue; // Bluetooth blue color

      icon = Icon(Icons.bluetooth_connected_sharp, color: iconColor);
      _lastKnownColor = iconColor;
    } else if (widget.connection == BconConnectionState.disconnected) {
      iconColor = Colors.red; // Red color for disconnected

      icon = Icon(Icons.bluetooth_disabled_sharp, color: iconColor);
      // icon = Icons.bluetooth_disabled_sharp;
      _lastKnownColor = iconColor;
    } else {
      iconColor = _lastKnownColor ?? Colors.grey; // Use the last known color or default to grey

      // Spent way too long figuring out how to get those icons to align. Turns out 2 pixels of padding is perfect for this situation
      // Also padding has to be in a container to work right
      icon = _showSearchingIcon
          ? Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Icon(Icons.bluetooth_searching_sharp, color: iconColor),
            )
          : Icon(Icons.bluetooth_sharp, color: iconColor);
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: SizedBox(width: 20, child: icon),
    );
  }
}
