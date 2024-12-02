import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/bcon_demo/bcon_single_card.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/bcon_demo/light_control_card.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/custom_screen.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/map_display_screen.dart';
import 'package:provider/provider.dart';

class BconGroupCard extends StatefulWidget {
  final VoidCallback onDelete;
  final String groupName;
  final List<ProvisionedMeshNode> nodes;
  final List<int> subscriptionAddresses; // group addresses that BCONs are subscribed to
  final MeshManagerApi meshManagerApi;
  final NordicNrfMesh nordicNrfMesh;

  const BconGroupCard({
    super.key,
    required this.onDelete,
    required this.groupName,
    required this.nodes,
    required this.subscriptionAddresses,
    required this.meshManagerApi,
    required this.nordicNrfMesh,
  });

  @override
  State<BconGroupCard> createState() => _BconGroupCardState();
}

class _BconGroupCardState extends State<BconGroupCard> {
  // Timer to prevent too many mesh messages
  Timer? _strobeTimer;

  @override
  Widget build(BuildContext context) {
    // Initialize shared state
    var bconState = context.watch<BconDemoState>();
    if (bconState.colors.length < widget.nodes.length) {
      for (var i = 0; i < widget.nodes.length; i++) {
        bconState.addColor(Colors.black);
        bconState.addConnection(BconConnectionState.disconnected);
      }
    }

    // function inside build because it has access to bconState and context
    void handleGroupOnColorSelect(Color hbColor, Color lbColor, bool hbControl, bool lbControl) {
      // no action if controls are toggled off
      if (!hbControl && !lbControl) {
        return;
      }

      List<int> addressesToSet = [];
      if (hbControl) {
        addressesToSet.add(widget.subscriptionAddresses[0]); // HBW
        addressesToSet.add(widget.subscriptionAddresses[1]); // HBR
        addressesToSet.add(widget.subscriptionAddresses[2]); // HBG
        addressesToSet.add(widget.subscriptionAddresses[3]); // HBB
      }
      if (lbControl) {
        addressesToSet.add(widget.subscriptionAddresses[6]); // LBR
        addressesToSet.add(widget.subscriptionAddresses[7]); // LBG
        addressesToSet.add(widget.subscriptionAddresses[8]); // LBB
      }
      setColor(hbColor, lbColor, addressesToSet, -1, hbControl, bconState, context);
    }

    void handleOnStrobeSelect(int data, StrobeMessage type, bool overrideTimer) {
      int address;

      if (type == StrobeMessage.dutyCycle) {
        address = widget.subscriptionAddresses[10];
      } else {
        address = widget.subscriptionAddresses[9];
      }

      sendStrobeMessage(address, data, overrideTimer);
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16.0),
        shape: const Border(),
        leading: const Image(
          image: AssetImage('assets/images/BCONGroupIcon.png'),
          height: 40,
          width: 40,
        ),
        title: Text(widget.groupName, style: Theme.of(context).textTheme.titleMedium),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${widget.nodes.length}/${widget.nodes.length}', style: Theme.of(context).textTheme.bodySmall),
              SizedBox(
                // width:
                // 30, // for some reason the IconButton is wider than its display or something so this constrains it to line up nicer. This may actually have something to do with the dropdown arrow icon
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: widget.onDelete, // Call the delete function
                ),
              ),
            ],
          ),
        ),
        children: [
          // I can make this way prettier but it's not necessary at the moment
          Container(
            margin: const EdgeInsets.all(6.0), // Adds margin around the container
            // padding: EdgeInsets.all(16.0), // Adds padding inside the container
            padding: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2.0), // Creates the border
              borderRadius: BorderRadius.circular(8.0), // Rounds the border edges
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Centers the header
              children: [
                Text(
                  'BCONs',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Column(
                  children: List.generate(widget.nodes.length, (index) {
                    return BconCard(
                      onDelete: () => deprovisionPrompt(widget.nodes[index]),
                      bconName: widget.nodes[index].uuid,
                      node: widget.nodes[index],
                      color: bconState.colors[index],
                      connection: bconState.connectionStates[index],
                      onSetCardColor: (hbColor, lbColor, addresses, hbConrol) =>
                          setColor(hbColor, lbColor, addresses, index, hbConrol, bconState, context),
                      onSetCardStrobe: (data, address, overrideTimer) =>
                          sendStrobeMessage(address, data, overrideTimer),
                    );
                  }),
                ),
              ],
            ),
          ),

          // Add BCON group controls here (Group addresses from bcon_demo_screen)
          Container(
            margin: const EdgeInsets.all(6.0), // Adds margin around the container
            // padding: EdgeInsets.all(16.0), // Adds padding inside the container
            // padding: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2.0), // Creates the border
              borderRadius: BorderRadius.circular(8.0), // Rounds the border edges
            ),
            child: LightControlCard(
              title: 'Group Controls',
              onColorSelect: (hbColor, lbColor, hbControl, lbControl) =>
                  handleGroupOnColorSelect(hbColor, lbColor, hbControl, lbControl),
              onStrobeSelect: (data, type, {overrideTimer = false}) => handleOnStrobeSelect(data, type, overrideTimer),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return MapDisplayScreen(
                        meshManagerApi: widget.meshManagerApi,
                        nordicNrfMesh: widget.nordicNrfMesh,
                        isConnected: true,
                      );
                    },
                  ),
                );
              },
              child: Text('Launch Map View', style: Theme.of(context).textTheme.labelMedium))
        ],
      ),
    );
  }

  void deprovisionPrompt(ProvisionedMeshNode node) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    // final node = await widget.meshManagerApi.meshNetwork!.getNode(elements[0].address);
    // final nodes = await widget.meshManagerApi.meshNetwork!.nodes;

    bool? removeTapped = await showDialog(
      context: context,
      builder: (_) => const DeprovisionPrompt(),
    );

    if (removeTapped == true) {
      try {
        final provisionedNode = widget.nodes.firstWhere((element) => element.uuid == node.uuid);
        await widget.meshManagerApi.deprovision(provisionedNode).timeout(const Duration(seconds: 40));
        // scaffoldMessenger.showSnackBar(const SnackBar(content: Text('OK')));
      } on TimeoutException catch (_) {
        scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
      } on PlatformException catch (e) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
      } on StateError catch (_) {
        scaffoldMessenger.showSnackBar(const SnackBar(content: Text('No node found with this uuid')));
      } catch (e) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }

    debugPrint("result was $removeTapped");
  }

  // Addresses should be the whole list of group addresses, or the list of addresses associated with a single node
  void setColor(hbColor, lbColor, addresses, index, hbConrol, BconDemoState bconState, context) async {
    // Should only update color state after getting response
    if (index == -1) {
      // index of -1 indicates update all indexes
      bconState.updateAllColors(hbColor);
    } else {
      bconState.updateColor(index, hbColor);
    }

    setColorOverMesh(hbColor, lbColor, addresses, hbConrol, context);
  }

  // Function to set color on RGB LED over the mesh
  void setColorOverMesh(Color hbColor, Color lbColor, List<int> addresses, bool hbControl, BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context); // for snackbars (bottom of screen pop ups)
    try {
      // Code below waits for a response from the board which never arrives when sent to a group address
      // Board response does arrive when sent directly to a device address
      // final redStatus = await widget.meshManagerApi
      //     .sendGenericLevelSet(addresses[cardNum * 3 + 0], ((color.red * 65355 / 255) - 32768).round())
      //     .timeout(const Duration(seconds: 5)); // originally set to 40 which is probably more reasonable
      // await widget.meshManagerApi
      //     .sendGenericLevelSet(addresses[cardNum * 3 + 1], ((color.green * 65355 / 255) - 32768).round())
      //     .timeout(const Duration(seconds: 5));
      // await widget.meshManagerApi
      //     .sendGenericLevelSet(addresses[cardNum * 3 + 2], ((color.blue * 65355 / 255) - 32768).round())
      //     .timeout(const Duration(seconds: 5));

      // Code from above with no awaiting or timeout management
      Future<GenericLevelStatusData> redStatus;
      Future<GenericLevelStatusData> greenStatus;
      Future<GenericLevelStatusData> blueStatus;

      // always run the loop over addresses at least once
      // There should only be 3, 4, or 6 addresses sent to this function

      // first address is for amber light
      if (hbControl) {
        int r = to16BitInt(hbColor.red);
        int g = to16BitInt(hbColor.green);
        int b = to16BitInt(hbColor.blue);
        int w = min(r, min(g, b));

        widget.meshManagerApi.sendGenericLevelSet(addresses[0], w);
        redStatus = widget.meshManagerApi.sendGenericLevelSet(addresses[1], r);
        greenStatus = widget.meshManagerApi.sendGenericLevelSet(addresses[2], g);
        blueStatus = widget.meshManagerApi.sendGenericLevelSet(addresses[3], b);
      } else {
        redStatus = widget.meshManagerApi.sendGenericLevelSet(addresses[0], to16BitInt(lbColor.red));
        greenStatus = widget.meshManagerApi.sendGenericLevelSet(addresses[1], to16BitInt(lbColor.green));
        blueStatus = widget.meshManagerApi.sendGenericLevelSet(addresses[2], to16BitInt(lbColor.blue));
      }

      if (addresses.length > 4) {
        int add = 0;
        if (hbControl) {
          add = 1;
        }
        widget.meshManagerApi.sendGenericLevelSet(addresses[3 + add], to16BitInt(lbColor.red));
        widget.meshManagerApi.sendGenericLevelSet(addresses[4 + add], to16BitInt(lbColor.green));
        widget.meshManagerApi.sendGenericLevelSet(addresses[5 + add], to16BitInt(lbColor.blue));
      }

      final completeRedStatus = await redStatus;
      final completeGreenStatus = await greenStatus;
      final completeBlueStatus = await blueStatus;
      debugPrint('[status] ${completeRedStatus.level}, ${completeGreenStatus.level}, ${completeBlueStatus.level}');
      // Error handling
    } on TimeoutException catch (_) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
    } on PlatformException catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void sendStrobeMessage(int address, int data, bool overrideTimer) {
    // Make sure no more than 10 strobe messages are sent per second
    if (overrideTimer || _strobeTimer == null || !_strobeTimer!.isActive) {
      // Start a new timer for 1/10 second
      _strobeTimer = Timer(const Duration(milliseconds: 100), () {
        _strobeTimer = null; // Reset the timer after it expires
        final scaffoldMessenger = ScaffoldMessenger.of(context); // for snackbars (bottom of screen pop ups)

        try {
          widget.meshManagerApi.sendGenericLevelSet(address, data - 32768).timeout(const Duration(seconds: 5));

          // override timer means that toggle strobe button was pressed (not old sliders) so also turn off lights
          // if (overrideTimer) {

          // Error handling
        } on TimeoutException catch (_) {
          scaffoldMessenger.clearSnackBars();
          scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
        } on PlatformException catch (e) {
          scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
        } catch (e) {
          scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
        }
      });
    }
  }

  /// Takes in a number from 0 - 255 and returns the corresponding 16 bit value from -32768 to 32767.
  int to16BitInt(int eightBitInt) {
    return ((eightBitInt * 65355 / 255) - 32768).round();
  }
}

/// The prompt that appears when you tap the trashcan icon on one of the BCONs in a group.
class DeprovisionPrompt extends StatelessWidget {
  const DeprovisionPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Warning',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Removing this BCON will remove it from the group and mesh entirely. Are you sure you want to proceed?',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // Dismiss the dialog and return false
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.grey), // Optional styling
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // Dismiss the dialog and return true
          },
          child: const Text(
            'Remove',
            style: TextStyle(color: Colors.red), // Optional styling for warning
          ),
        ),
      ],
    );
  }
}
