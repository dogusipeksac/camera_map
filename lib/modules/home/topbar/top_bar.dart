import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'flash/controller/flash_controller.dart'; // 📍 path senin klasöre göre ayarlandı

class TopBar extends StatelessWidget {
  final VoidCallback? onAspectRatioTap;
  final VoidCallback? onGalleryTap;
  final VoidCallback? onSwitchCameraTap;
  final VoidCallback? onSettingsTap;

  const TopBar({
    super.key,
    this.onAspectRatioTap,
    this.onGalleryTap,
    this.onSwitchCameraTap,
    this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    final flashController = Get.find<FlashController>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 📐 Aspect Ratio
            IconButton(
              icon: const Icon(Icons.aspect_ratio, color: Colors.white),
              onPressed: onAspectRatioTap,
            ),

            // ⚡ Flash Icon (reactive)
            Obx(() {
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
            }),

            // 🖼️ Gallery Icon
            IconButton(
              icon: const Icon(Icons.add_photo_alternate_outlined, color: Colors.white),
              onPressed: onGalleryTap,
            ),

            // 🔄 Camera Switch
            IconButton(
              icon: const Icon(Icons.flip_camera_android, color: Colors.white),
              onPressed: onSwitchCameraTap,
            ),

            // ⚙️ Settings
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: onSettingsTap,
            ),
          ],
        ),
      ),
    );
  }
}
