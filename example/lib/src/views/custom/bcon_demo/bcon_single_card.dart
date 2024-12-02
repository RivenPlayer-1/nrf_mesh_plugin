import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/bcon_demo/bcon_icon.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/bcon_demo/single_bcon_control_screen.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/custom_screen.dart';
import 'package:nordic_nrf_mesh_example/src/widgets/bluetooth_icon.dart';

class BconCard extends StatelessWidget {
  final VoidCallback onDelete;
  final String bconName;
  final ProvisionedMeshNode node;
  final Color color;
  final BconConnectionState connection;
  final Function(Color, Color, List<int>, bool) onSetCardColor;
  final Function(int, int, bool) onSetCardStrobe;

  const BconCard(
      {super.key,
      required this.onDelete,
      required this.bconName,
      required this.node,
      required this.color,
      required this.connection,
      required this.onSetCardColor,
      required this.onSetCardStrobe});

  @override
  Widget build(BuildContext context) {
    // Get the current theme data
    final ThemeData currentTheme = Theme.of(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => SingleBconControlScreen(
                    bconName: bconName,
                    node: node,
                    setCardColor: (hbColor, lbColor, addresses, hbConrol) =>
                        onSetCardColor(hbColor, lbColor, addresses, hbConrol),
                    setCardStrobe: (data, address, overrideTimer) => onSetCardStrobe(data, address, overrideTimer),
                    theme: currentTheme,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          // Use Row to align the contents
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BconIcon(color: color),
                  const SizedBox(width: 20),
                  Text(bconName.length > 16 ? '${bconName.substring(0, 15)}...' : bconName,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            // connection == BconConnectionState.connected
            //     ? const Icon(Icons.bluetooth_connected_sharp)
            //     : connection == BconConnectionState.disconnected
            //         ? const Icon(Icons.bluetooth_disabled_sharp)
            //         : const Icon(Icons.bluetooth_searching_sharp),
            BluetoothIcon(connection: connection),
            // Icon(Icons.bluetooth_sharp),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete, // Call the delete function
            ),
          ],
        ),
      ),
    );
  }
}
