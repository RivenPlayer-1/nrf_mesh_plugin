import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class SendGenericLocation extends StatefulWidget {
  final MeshManagerApi meshManagerApi;

  const SendGenericLocation(this.meshManagerApi, {Key? key}) : super(key: key);

  @override
  State<SendGenericLocation> createState() => _SendGenericLocationState();
}

class _SendGenericLocationState extends State<SendGenericLocation> {
  late int selectedElementAddress = 172;

  bool parametersAsHex = false;

  final TextEditingController _addressController = TextEditingController(text: "172");

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Send a generic location message'),
      initiallyExpanded: false,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Element Address (dec)'),
                controller: _addressController,
                onChanged: (text) {
                  selectedElementAddress = int.parse(text);
                },
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () async {
            final scaffoldMessenger = ScaffoldMessenger.of(context);
            try {
              var status = await widget.meshManagerApi
                  .sendGenericLocationGlobalGet(selectedElementAddress)
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
          },
          child: const Text('Send location message'),
        )
      ],
    );
  }
}
