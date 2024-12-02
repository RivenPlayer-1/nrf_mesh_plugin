import 'dart:async';

import 'package:flutter/material.dart';

class LightControlCard extends StatefulWidget {
  final String title;
  final int cardNum;
  final Function(Color, Color, bool, bool) onColorSelect;
  final Function(int data, StrobeMessage type, {bool overrideTimer}) onStrobeSelect;

  const LightControlCard(
      {super.key, required this.title, this.cardNum = 0, required this.onColorSelect, required this.onStrobeSelect});

  @override
  State<LightControlCard> createState() => _LightControlCardState();
}

class _LightControlCardState extends State<LightControlCard> {
  bool _hbControl = true;
  bool _lbControl = true;
  double _brightnessLevel = 0.5;
  int _onDutyCycleTime = 0; // 0 - 255 range
  int _offDutyCycleTime = 0; // 0 - 255 range
  int _strobeChannel = 0; // 0 - 9
  int _strobeBrightness = 0; // 0 - 255

  // Define the colors and their RGB values
  // final List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.purple];
  // More saturated colors (better for physical LED)
  final List<Color> hbColors = [
    const Color.fromARGB(255, 255, 0, 0),
    const Color.fromARGB(255, 0, 255, 8),
    // const Color.fromARGB(255, 0, 140, 255),
    const Color.fromARGB(255, 35, 0, 255),
    const Color.fromARGB(255, 255, 255, 255),
    // const Color.fromARGB(255, 255, 230, 0),
    const Color.fromARGB(255, 0, 0, 0),
  ];

  final List<Color> lbColors = [
    const Color.fromARGB(255, 255, 5, 0),
    const Color.fromARGB(255, 0, 255, 8),
    // const Color.fromARGB(255, 0, 140, 255),
    const Color.fromARGB(255, 35, 0, 255),
    const Color.fromARGB(255, 255, 150, 150),
    // const Color.fromARGB(255, 255, 230, 0),
    const Color.fromARGB(255, 0, 0, 0),
  ];

  final List<String> _channelOptions = [
    'Choose',
    "HB White LED",
    "HB Red LED",
    "HB Green LED",
    "HB Blue LED",
    "HB NIR LED",
    "HB SWIR LED",
    "LB Red LED",
    "LB Green LED",
    "LB Blue LED"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(hbColors.length, (index) {
              return ColorBox(
                color: hbColors[index],
                onTap: () => {
                  widget.onColorSelect(colorScale(hbColors[index], _brightnessLevel),
                      colorScale(lbColors[index], _brightnessLevel), _hbControl, _lbControl)
                },
              );
            }),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Control High Brightness '),
              Switch(
                value: _hbControl,
                onChanged: (newValue) => setState(() {
                  _hbControl = newValue;
                }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Control Low Brightness '),
              Switch(
                value: _lbControl,
                onChanged: (newValue) => setState(() {
                  _lbControl = newValue;
                }),
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Brightness Level'),
              Expanded(
                child: Slider(
                  value: _brightnessLevel,
                  onChanged: (newValue) => setState(() {
                    _brightnessLevel = newValue;
                  }),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    int newValue = 0;
                    if (_strobeBrightness == 0) {
                      newValue = 255;
                    }

                    _strobeBrightness = newValue;
                    _onDutyCycleTime = newValue;
                    _offDutyCycleTime = newValue;
                    _strobeChannel = 2;
                  });

                  sendDutyCyle();
                  sendChannel(overrideTimer: true);
                },
                child: Text(
                  _strobeBrightness == 0 ? 'Turn On Strobe' : 'Turn Off Strobe',
                  // style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  } //build

  // When strobe duty cycle sliders changed
  void sendDutyCyle() {
    int combinedValue = (_onDutyCycleTime << 8) | _offDutyCycleTime;
    // debugPrint(combinedValue.toRadixString(16));

    widget.onStrobeSelect(combinedValue, StrobeMessage.dutyCycle);
  }

  // When channel drop down or strobe brightness changed
  void sendChannel({overrideTimer = false}) {
    // Skip if channel is still on "choose"
    if (_strobeChannel == 0) {
      return;
    }

    int combinedValue = ((_strobeChannel - 1) << 8) | _strobeBrightness;
    // debugPrint(combinedValue.toRadixString(16));

    widget.onStrobeSelect(combinedValue, StrobeMessage.channel, overrideTimer: overrideTimer);
  }
}

// Separate class for the individual colored buttons
class ColorBox extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const ColorBox({required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Set the button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners
            side: const BorderSide(color: Colors.black, width: 2), // Black border
          ),
          padding: const EdgeInsets.all(0), // Remove default padding
        ),
        child: const SizedBox.shrink(),
      ),
    );
  }
}

Color colorScale(Color color, double scale) {
  // Ensure the scale is between 0.0 and 1.0
  scale = scale.clamp(0.0, 1.0);
  double scaleSquared = scale * scale;

  // Scale the red, green, and blue components
  int scaledRed = (color.red * scaleSquared).round().clamp(0, 255);
  int scaledGreen = (color.green * scaleSquared).round().clamp(0, 255);
  int scaledBlue = (color.blue * scaleSquared).round().clamp(0, 255);

  // Return a new color with the scaled values, maintaining the original alpha value
  return Color.fromARGB(color.alpha, scaledRed, scaledGreen, scaledBlue);
}

enum StrobeMessage {
  dutyCycle,
  channel,
}
