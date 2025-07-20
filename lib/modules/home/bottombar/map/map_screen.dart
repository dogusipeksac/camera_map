import 'package:camera_map/core/utils/component/editable_textbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const LatLng location = LatLng(40.9339192, 29.3252624);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('automatic_text'.tr),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Harita
            SizedBox(
              height: 250,
              width: double.infinity,
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: location,
                  zoom: 18,
                ),
                markers: {
                  Marker(markerId: const MarkerId('pin'), position: location),
                },
                zoomControlsEnabled: false,
                onMapCreated: (controller) {},
                myLocationButtonEnabled: false,
              ),
            ),

            const SizedBox(height: 16),

            // GPS Coordinates
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'gps_coordinates'.tr,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 16),

            // Latitude & Longitude
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: EditableTextBox(
                      label: 'latitude'.tr,
                      hint: 'latitude'.tr,
                      controller: null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: EditableTextBox(
                      label: 'longitude'.tr,
                      hint: 'longitude'.tr,
                      controller: null,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Location
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'location'.tr,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: EditableTextBox(
                label: 'line_1'.tr,
                hint: 'line_1'.tr,
                controller: null,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: EditableTextBox(
                label: 'line_2'.tr,
                hint: 'line_2'.tr,
                controller: null,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: EditableTextBox(
                label: 'line_3'.tr,
                hint: 'line_3'.tr,
                controller: null,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
