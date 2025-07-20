// controllers/map_controller.dart
import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapController extends GetxController {
  final Rx<LatLng> currentLocation = const LatLng(41.0082, 28.9784).obs;
  final Completer<GoogleMapController> mapController = Completer();

  @override
  void onInit() {
    super.onInit();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) return;

    final position = await Geolocator.getCurrentPosition();
    currentLocation.value = LatLng(position.latitude, position.longitude);
  }

  Future<void> moveCameraToCurrentLocation() async {
    final controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newLatLng(currentLocation.value));
  }
}
