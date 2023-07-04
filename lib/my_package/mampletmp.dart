import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MaSample extends StatefulWidget {
  const MaSample({Key? key}) : super(key: key);

   State<MaSample> createState() => _MaSample();
}

class _MaSample extends State<MaSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.23476133580664, 132.273409655962),
    zoom: 13.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 12.8334901395799,
      target: LatLng(34.40274365331129, 132.42345257078792),
      tilt: 59.440717697143555,
      zoom: 18.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the travel!'),
        icon: const Icon(Icons.wallet_travel),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}