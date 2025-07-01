import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controllers/permission_controller.dart';
import '../widgets/access_tile.dart';

class PermissionView extends GetView<PermissionController> {
  const PermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.cameraGranted.value &&
              controller.locationGranted.value &&
              controller.galleryGranted.value) {
            Future.microtask(() => Get.offAllNamed(Routes.camera));
          }

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Image.asset(
                    'assets/images/access_illustration.png',
                    height: 150,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'access_title'.tr,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'access_description'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 32),
                  AccessTile(
                    icon: Icons.photo_camera,
                    title: 'camera_access'.tr,
                    subtitle: 'camera_desc'.tr,
                    valueRx: controller.cameraGranted,
                    onChanged: controller.toggleCamera,
                  ),
                  AccessTile(
                    icon: Icons.location_on,
                    title: 'location_access'.tr,
                    subtitle: 'location_desc'.tr,
                    valueRx: controller.locationGranted,
                    onChanged: controller.toggleLocation,
                  ),
                  AccessTile(
                    icon: Icons.photo_library,
                    title: 'gallery_access'.tr,
                    subtitle: 'gallery_desc'.tr,
                    valueRx: controller.galleryGranted,
                    onChanged: controller.toggleGallery,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
