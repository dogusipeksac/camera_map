import 'dart:io';
import 'package:camera_map/modules/home/bottombar/gallery/lastphoto/last_photo_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LastPhotoDetailView extends StatelessWidget {
  const LastPhotoDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LastPhotoDetailController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('last_photo_title'.tr),
        centerTitle: true,
      ),
      body: Obx(() {
        final File? file = controller.latestPhoto.value;

        if (file == null) {
          return Center(child: Text('no_photo_found'.tr));
        }

        return Center(
          child: Image.file(
            file,
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
          ),
        );
      }),
    );
  }
}
