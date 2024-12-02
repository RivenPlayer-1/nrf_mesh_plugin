import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class BconSliderElement extends StatefulWidget {
  final ElementData? element;
  final MeshManagerApi meshManagerApi;
  final String title;
  final int bothValues;
  final ValueChanged<int> onChanged;

  const BconSliderElement(this.element, this.bothValues, this.title, this.meshManagerApi,
      {Key? key, required this.onChanged})
      : super(key: key);

  @override
  State<BconSliderElement> createState() => _BconSliderElementState();
}

class _BconSliderElementState extends State<BconSliderElement> {
  int _value1 = 0; // 0 - 255 range
  int _value2 = 0; // 0 - 255 range
  int _combinedValue = 0; // 16 bits to hold [_value1][_value2]
  bool _slidersLinked = true;

  @override
  void initState() {
    // _value1 = ;
    // _value2 = ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.element != null) {
      final bool hasGenericLevelModel = widget.element!.models.any((model) => model.modelId == 0x1002);

      return hasGenericLevelModel
          ? Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 1), // Thin light gray border
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              padding: const EdgeInsets.all(3), // Optional padding

              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.title,
                            style: const TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Address: ${widget.element!.address}',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LevelSlider((widget.bothValues & 0xFF00) >> 8, (value) {
                        _value1 = value;
                        if (_slidersLinked) {
                          _value2 = _value1;
                        }
                        _combineAndSend();
                      }),
                      Column(
                        children: [
                          IconButton(
                            onPressed: toggleLock,
                            icon: Icon(_slidersLinked ? Icons.lock_outline : Icons.lock_open_outlined),
                          ),
                          Text('0x${_combinedValue.toRadixString(16).toUpperCase().padLeft(4, '0')}'),
                        ],
                      ),
                      LevelSlider(widget.bothValues & 0x00FF, (value) {
                        _value2 = value;
                        if (_slidersLinked) {
                          _value1 = _value2;
                        }
                        _combineAndSend();
                      }),
                    ],
                  ),
                ],
              ),
            )
          : const SizedBox.shrink();
    } else {
      // null element
      return Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 1), // Thin light gray border
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
              padding: const EdgeInsets.all(8), // Optional padding
              child: Column(
                children: [
                  Text('No ${widget.title} control available'),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

  toggleLock() {
    setState(() {
      _slidersLinked = !_slidersLinked;
    });
  }

  _combineAndSend() {
    setState(() {
      // Encode two 8 bit values into one 16 bit value
      _combinedValue = (_value1 << 8) | _value2;
      widget.onChanged(_combinedValue);
    });
  }
}

class LevelSlider extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final int value;

  const LevelSlider(this.value, this.onChanged, {super.key});

  @override
  // LevelSliderState createState() => LevelSliderState();
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        children: [
          Slider(
            value: value.toDouble(),
            min: 0,
            max: 255,
            // label: 'Value: ${value.toInt()}',
            onChanged: (value) {
              onChanged(value.toInt());
              // Check if a second has passed since the last call
            },
          ),
          Text("${value.toInt()}, 0x${value.toRadixString(16).toUpperCase().padLeft(2, '0')}")
        ],
      ),
    );
  }
}
