import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/flash_controller.dart';

class FlashWidgets extends StatelessWidget {
  const FlashWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final flashController = Get.find<FlashController>();

    return Obx(() {
      IconData icon;
      switch (flashController.flashMode.value) {
        case FlashMode.auto:
          icon = Icons.flash_auto;
          break;
        case FlashMode.torch:
        case FlashMode.always:
          icon = Icons.flash_on;
          break;
        case FlashMode.off:
        default:
          icon = Icons.flash_off;
      }

      return IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: () => flashController.toggleFlash(),
      );
    });
  }
}
