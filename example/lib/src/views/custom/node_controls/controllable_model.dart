import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';
import 'package:nordic_nrf_mesh_example/src/views/custom/node_controls/model_dictionary.dart';

class ControllableModel extends StatelessWidget {
  final ModelData model;
  final int elementAddress;
  final MeshManagerApi meshManagerApi;

  const ControllableModel(this.model, this.elementAddress, this.meshManagerApi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Don't display models without app key
    if (!isAppKeyBound()) {
      return const SizedBox.shrink();
    }

    Widget control = const SizedBox.shrink();

    // Generic On Off server (receiver like a light bulb)
    if (model.modelId == 0x1000) {
      control = OnOffSlider(elementAddress, meshManagerApi);
    }

    // Generic Level server (receiver like a dimmable light)
    if (model.modelId == 0x1002) {
      control = LevelSlider(elementAddress, meshManagerApi);
    }

    if (model.modelId == 0x100E) {
      control = LocationButton(elementAddress, meshManagerApi);
    }

    String modelString = meshModelIdentifiers.containsKey(model.modelId)
        ? "${meshModelIdentifiers[model.modelId]}"
        : "Model id: ${model.modelId}";

    return Row(
      children: <Widget>[Text(modelString), appKeyBindIcon(), control],
    );
  }

  bool isAppKeyBound() {
    return model.boundAppKey.isNotEmpty;
  }

  Icon appKeyBindIcon() {
    return isAppKeyBound()
        ? const Icon(
            Icons.check,
            size: 15,
            color: Colors.green,
          )
        : const Icon(
            Icons.clear,
            size: 15,
            color: Colors.red,
          );
  }
}

class OnOffSlider extends StatefulWidget {
  final int elementAddress;
  final MeshManagerApi meshManagerApi;

  const OnOffSlider(this.elementAddress, this.meshManagerApi, {super.key});

  @override
  OnOffSliderState createState() => OnOffSliderState();
}

class OnOffSliderState extends State<OnOffSlider> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isOn,
      onChanged: (value) {
        setState(() {
          _isOn = value;
        });
        sendGenericOnOffCommand(context);
      },
    );
  }

  Future<void> sendGenericOnOffCommand(BuildContext context) async {
    {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      debugPrint('send level $_isOn to ${widget.elementAddress}');
      final provisionerUuid = await widget.meshManagerApi.meshNetwork!.selectedProvisionerUuid();
      final nodes = await widget.meshManagerApi.meshNetwork!.nodes;
      try {
        final provisionedNode = nodes.firstWhere((element) => element.uuid == provisionerUuid);
        final sequenceNumber = await widget.meshManagerApi.getSequenceNumber(provisionedNode);

        await widget.meshManagerApi
            .sendGenericOnOffSet(widget.elementAddress, _isOn, sequenceNumber)
            .timeout(const Duration(seconds: 3)); // originally set to 40 which is probably more reasonable
      } on TimeoutException catch (_) {
        scaffoldMessenger.clearSnackBars();
        scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond to set OnOff')));
      } on StateError catch (_) {
        scaffoldMessenger
            .showSnackBar(SnackBar(content: Text('No provisioner found with this uuid : $provisionerUuid')));
      } on PlatformException catch (e) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
      } catch (e) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }
}

class LevelSlider extends StatefulWidget {
  final int elementAddress;
  final MeshManagerApi meshManagerApi;

  const LevelSlider(this.elementAddress, this.meshManagerApi, {super.key});

  @override
  LevelSliderState createState() => LevelSliderState();
}

class LevelSliderState extends State<LevelSlider> {
  double _value = 0.0;
  Timer? _colorChangeTimer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Slider(
          value: _value,
          min: 0,
          max: 100,
          label: 'Value: ${_value.toInt()}',
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            // Check if a second has passed since the last call
            if (_colorChangeTimer == null || !_colorChangeTimer!.isActive) {
              sendGenericLevelCommand(context);

              // Start a new timer for 1/20 second
              _colorChangeTimer = Timer(const Duration(milliseconds: 50), () {
                _colorChangeTimer = null; // Reset the timer after it expires
              });
            }
            sendGenericLevelCommand(context);
          }),
    );
  }

  Future<void> sendGenericLevelCommand(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    debugPrint('send level $_value% to ${widget.elementAddress}');
    try {
      await widget.meshManagerApi
          .sendGenericLevelSet(widget.elementAddress, ((_value * 65355 / 100) - 32768).round())
          .timeout(const Duration(seconds: 5));
    } on TimeoutException catch (_) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond to set Level')));
    } on PlatformException catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}

class LocationButton extends StatelessWidget {
  final int elementAddress;
  final MeshManagerApi meshManagerApi;

  const LocationButton(this.elementAddress, this.meshManagerApi, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        sendGenericLocationGlobalGet(context);
      },
      child: const Text('Location Get'),
    );
  }

  Future<void> sendGenericLocationGlobalGet(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      var status = await meshManagerApi
          .sendGenericLocationGlobalGet(
            elementAddress,
          )
          .timeout(const Duration(seconds: 5));

      // Duplicating functionality of getPosition function from GlobalLatitude.java and GlobalLongitude.java
      double latitude = (status.latitude.toDouble()) / (pow(2, 31) - 1) * 90;
      // add or subtract 90 to account for stupid encoding thing since uint32_t cast in c doesn't like negative doubles
      if (status.latitude < 0) {
        latitude += 90;
      } else {
        latitude -= 90;
      }

      // Duplicating functionality of getPosition function from GlobalLatitude.java and GlobalLongitude.java
      double longitude = (status.longitude.toDouble()) / (pow(2, 31) - 1) * 180;
      // add or subtract 180 to account for stupid encoding thing since uint32_t cast in c doesn't like negative doubles
      if (status.longitude < 0) {
        longitude += 180;
      } else {
        longitude -= 180;
      }
      int altitude = status.altitude;

      String message = "Latitude: $latitude, Longitude: $longitude, Altitude: $altitude";

      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
    } on TimeoutException catch (_) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text('Board didn\'t respond')));
    } on PlatformException catch (e) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(SnackBar(content: Text('${e.message}')));
    } catch (e) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
