import 'package:flutter/cupertino.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/control_module/model.dart';

class MeshElement extends StatelessWidget {
  final ElementData element;

  const MeshElement(this.element, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Element address : ${element.address}', style: const TextStyle(decoration: TextDecoration.underline)),
        Wrap(
          children: <Widget>[
            const Text('Models: '),
            ...element.models.map((e) => Model(e)),
            const SizedBox(height: 40),
          ],
        )
      ],
    );
  }
}
