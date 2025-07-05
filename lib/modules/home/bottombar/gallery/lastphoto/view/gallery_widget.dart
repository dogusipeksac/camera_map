import 'dart:io';
import 'package:camera_map/modules/home/bottombar/gallery/lastphoto/last_photo_detail_controller.dart';
import 'package:camera_map/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LastPhotoDetailController>();

    return Obx(() {
      final file = controller.latestPhoto.value;

      return GestureDetector(
        onTap: () {
          if (file != null) {
            Get.toNamed(Routes.lastPhotoDetail);
          } else {
            Get.snackbar(
              'No Photo',
              'There is no recent photo available.',
              backgroundColor: Colors.black87,
              colorText: Colors.white,
            );
          }
        },
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            shape: BoxShape.circle,
            image: file != null
                ? DecorationImage(image: FileImage(file), fit: BoxFit.cover)
                : null,
            color: Colors.grey.shade800,
          ),
          child: file == null
              ? const Icon(Icons.photo, color: Colors.white)
              : null,
        ),
      );
    });
  }
}
