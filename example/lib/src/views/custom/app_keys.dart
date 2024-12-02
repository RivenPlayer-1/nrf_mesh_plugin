// THIS FILE IS NOT IMPORTANT ANYMORE

import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class AppKeys extends StatefulWidget {
  final NordicNrfMesh nordicNrfMesh;

  const AppKeys({Key? key, required this.nordicNrfMesh}) : super(key: key);

  @override
  State<AppKeys> createState() => _AppKeysState();
}

// temporary for examples
class _AppKeysState extends State<AppKeys> {
  List<AppKey> appkeys = [
    AppKey(name: 'app key 1'),
    AppKey(name: 'app key 2'),
  ];

  @override
  Widget build(BuildContext context) {
    Widget body = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Text('hello world'),
          for (var i = 0; i < appkeys.length; i++)
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return Node(
                //         meshManagerApi: widget.meshManagerApi,
                //         node: nodes[i],
                //         name: nodes[i].uuid,
                //       );
                //     },
                //   ),
                // );
                debugPrint('App key \'${appkeys[i]}\' pressed');
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    key: ValueKey('appkey-$i'),
                    child: Text(appkeys[i].name),
                  ),
                ),
              ),
            ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage App Keys'),
      ),
      body: body,
      // Bottom right button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {addAppKey(widget.nordicNrfMesh.meshManagerApi)},
        tooltip: 'Increment',
        icon: const Icon(Icons.add),
        label: const Text('Add App Key'),
      ),
    );
  }
}

class AppKey {
  final String name;

  AppKey({required this.name});

  // Overriding the toString method
  @override
  String toString() {
    return name;
  }
}

void addAppKey(MeshManagerApi meshManagerApi) async {
  debugPrint('Add App key pressed 5');

  final int num = await meshManagerApi.customTest();

  debugPrint('Add App key pressed $num');

  final bool success = await meshManagerApi.addAppKey();

  debugPrint('Add App key result: $success');
}

// void addAppKey () {
//   debugPrint('Add App key pressed 3');
// }
