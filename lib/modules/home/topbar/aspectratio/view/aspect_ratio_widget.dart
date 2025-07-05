import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/camera_settings_controller.dart';

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CameraSettingsController controller = Get.find();

    return IconButton(
      icon: const Icon(Icons.aspect_ratio, color: Colors.white),
      onPressed: controller.togglePanel,
    );
  }
}
