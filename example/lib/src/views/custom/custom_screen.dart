import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/bcon_demo_screen.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/bcon_sliders/bcon_sliders_screen.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/color_picker_screen.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/map_display_screen.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/node_controls/node_control_screen.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/switches_screen.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/vendor_model/vendor_model_screen.dart';

class CustomScreen extends StatefulWidget {
  final NordicNrfMesh nordicNrfMesh;

  const CustomScreen({Key? key, required this.nordicNrfMesh}) : super(key: key);

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  late MeshManagerApi _meshManagerApi;
  late Widget body;

  @override
  void initState() {
    super.initState();
    _meshManagerApi = widget.nordicNrfMesh.meshManagerApi;
  }

  @override
  Widget build(BuildContext context) {
    body = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Custom pages (firmware in parentheses)',
              style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
          const SizedBox(height: 20),
          customPageButton(openSwitchesPage, 'Light Switches (Mesh Light)'),
          customPageButton(openColorPicker, 'RGB Controller (generic_level_set)'),
          customPageButton(openNodeControl, 'Node Controller (general purpose)'),
          customPageButton(openMapDisplay, 'Map Display (bcon-firmware)'),
          customPageButton(openBconDemo, 'Bcon Demo (bcon-firmware)'),
          customPageButton(openBconSliders, 'Bcon Sliders Demo (bcon-firmware)'),
          customPageButton(openVendorModelScreen, 'Custom Vendor Model (bcon-firmware)'),
        ],
      ),
    );

    return body;
  }

  void openSwitchesPage(BuildContext context, MeshManagerApi meshManagerApi, NordicNrfMesh nordicNrfMesh) {
    debugPrint("Open Switches Page button pressed");

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SwitchesScreen(meshManagerApi: meshManagerApi, nordicNrfMesh: nordicNrfMesh);
        },
      ),
    );
  }

  void openColorPicker(BuildContext context, MeshManagerApi meshManagerApi, NordicNrfMesh nordicNrfMesh) {
    debugPrint("Open Color Picker button pressed");

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ColorPickerScreen(meshManagerApi: meshManagerApi, nordicNrfMesh: nordicNrfMesh);
        },
      ),
    );
  }

  void openNodeControl(BuildContext context, MeshManagerApi meshManagerApi, NordicNrfMesh nordicNrfMesh) {
    debugPrint("Open Node Control button pressed");

    // setState(() {
    //   body = NodeControlScreen(meshManagerApi: meshManagerApi);
    // });

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Node Controls')),
            body: NodeControlScreen(meshManagerApi: meshManagerApi, nordicNrfMesh: nordicNrfMesh),
          );
        },
      ),
    );
  }

  void openMapDisplay(BuildContext context, MeshManagerApi meshManagerApi, NordicNrfMesh nordicNrfMesh) {
    debugPrint("Open Map Display button pressed");

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MapDisplayScreen(meshManagerApi: meshManagerApi, nordicNrfMesh: nordicNrfMesh);
        },
      ),
    );
  }

  void openBconDemo(BuildContext context, MeshManagerApi meshManagerApi, NordicNrfMesh nordicNrfMesh) {
    // debugPrint("Open Bcon demo button pressed");

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return BconDemoScreen(meshManagerApi: meshManagerApi, nordicNrfMesh: nordicNrfMesh);
        },
      ),
    );
  }

  void openBconSliders(BuildContext context, MeshManagerApi meshManagerApi, NordicNrfMesh nordicNrfMesh) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Bcon Sliders Demo')),
            body: BconSlidersScreen(nordicNrfMesh: nordicNrfMesh, meshManagerApi: meshManagerApi),
          );
        },
      ),
    );
  }

  void openVendorModelScreen(BuildContext context, MeshManagerApi meshManagerApi, NordicNrfMesh nordicNrfMesh) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('BCON Light/Strobe Control')),
            body: VendorModelScreen(nordicNrfMesh: nordicNrfMesh, meshManagerApi: meshManagerApi),
          );
        },
      ),
    );
  }

  Widget customPageButton(Function onPressed, String text) {
    return Row(
      // I can definitely parameterize these rows
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onPressed(context, _meshManagerApi, widget.nordicNrfMesh);
            },
            child: Text(text),
          ),
        ),
      ],
    );
  }
}

// Implemented in app.dart
class BconDemoState extends ChangeNotifier {
  List<Color> colors = [];
  List<BconConnectionState> connectionStates = [];
  List<Location> locations = [];

  void updateColor(int index, Color color) {
    colors[index] = color;
    notifyListeners();
  }

  void updateLocation(int index, Location location) {
    locations[index] = location;
    notifyListeners();
  }

  void updateLocationResponsive(int index, bool responsive) {
    locations[index].responsive = responsive;
    notifyListeners();
  }

  void updateConnection(int index, BconConnectionState state) {
    connectionStates[index] = state;
    notifyListeners();
  }

  void setColors(newList) {
    colors = newList;
    notifyListeners();
  }

  void addColor(color) {
    colors.add(color);
    // notifyListeners();
  }

  void addLocation(location) {
    locations.add(location);
  }

  void addConnection(state) {
    connectionStates.add(state);
    // notifyListeners();
  }

  void updateAllColors(color) {
    for (var i = 0; i < colors.length; i++) {
      colors[i] = color;
    }

    notifyListeners();
  }

  void updateAllConnections(state) {
    for (var i = 0; i < connectionStates.length; i++) {
      connectionStates[i] = state;
    }

    notifyListeners();
  }
}

enum BconConnectionState {
  connected,
  disconnected,
  connecting,
}
