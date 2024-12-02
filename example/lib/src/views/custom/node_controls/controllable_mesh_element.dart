import 'package:flutter/cupertino.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/node_controls/controllable_model.dart';

class ControllableMeshElement extends StatelessWidget {
  final ElementData element;
  final MeshManagerApi meshManagerApi;

  const ControllableMeshElement(this.element, this.meshManagerApi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Element address : ${element.address}', style: const TextStyle(decoration: TextDecoration.underline)),
        Wrap(
          children: <Widget>[
            const Text('Models: '),
            ...element.models.map((model) => ControllableModel(model, element.address, meshManagerApi)),
            const SizedBox(height: 40),
          ],
        )
      ],
    );
  }
}
