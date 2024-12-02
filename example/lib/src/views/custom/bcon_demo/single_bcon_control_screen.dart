import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/bcon_demo/light_control_card.dart';

class SingleBconControlScreen extends StatefulWidget {
  final String bconName;
  final ProvisionedMeshNode node;
  final void Function(Color, Color, List<int>, bool) setCardColor;
  final void Function(int, int, bool) setCardStrobe;
  final ThemeData theme;

  const SingleBconControlScreen(
      {super.key,
      required this.bconName,
      required this.node,
      required this.setCardColor,
      required this.theme,
      required this.setCardStrobe});

  @override
  State<SingleBconControlScreen> createState() => _SingleBconControlScreenState();
}

class _SingleBconControlScreenState extends State<SingleBconControlScreen> {
  bool isLoading = true;

  late int nodeAddress;
  late List<ElementData> elements;
  late int genericLevelServerCount = 0;
  late List<int> addresses = [];

  static const int genericLevelServer = 0x1002;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    nodeAddress = await widget.node.unicastAddress;
    elements = await widget.node.elements;

    // Count how many generic level servers there are
    for (var element in elements) {
      for (var model in element.models) {
        if (model.key == genericLevelServer) {
          genericLevelServerCount++;
          addresses.add(element.address);
        }
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: widget.theme,
      child: Scaffold(
          appBar: AppBar(title: Text('${widget.bconName} Control')),
          body: Column(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(16),
                child: LightControlCard(
                  title: "Single Control",
                  cardNum: 0,
                  onColorSelect: (hbColor, lbColor, hbControl, lbControl) =>
                      handleOnColorSelect(hbColor, lbColor, hbControl, lbControl),
                  onStrobeSelect: (data, type, {bool overrideTimer = false}) =>
                      handleOnStrobeSelect(data, type, overrideTimer),
                ),
              )
            ],
          )),
    );
  }

  handleOnColorSelect(Color hbColor, Color lbColor, bool hbControl, bool lbControl) {
    // no action if controls are off
    if (!hbControl && !lbControl) {
      return;
    }

    List<int> addressesToSet = [];

    if (hbControl) {
      addressesToSet.add(addresses[0]); // HBR

      addressesToSet.add(addresses[1]); // HBR
      addressesToSet.add(addresses[2]); // HBG
      addressesToSet.add(addresses[3]); // HBB
    }
    if (lbControl) {
      addressesToSet.add(addresses[6]); // LBR
      addressesToSet.add(addresses[7]); // LBG
      addressesToSet.add(addresses[8]); // LBB
    }
    widget.setCardColor(hbColor, lbColor, addressesToSet, hbControl);
  }

  handleOnStrobeSelect(int data, StrobeMessage type, bool overrideTimer) {
    int address = addresses[0];

    if (addresses.length > 10) {
      if (type == StrobeMessage.dutyCycle) {
        address = addresses[10];
      } else {
        address = addresses[9];
      }
    }
    widget.setCardStrobe(data, address, overrideTimer);
  }
}
