import 'package:camera_map/modules/camera/views/photogenerate/photo_generate.dart';
import 'package:camera_map/modules/camera/views/topbar/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/camera_controller.dart' as my;
import 'banner/ad_banner_widget.dart';
import 'bottombar/bottom_bar.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final my.CameraController controller = Get.find();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (!controller.isCameraReady.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Stack(
          children: [
            Column(
              children: [
                TopBar(),
                PhotoGenerate(),
                BottomBar(
                  onCameraTap: () async {
                    await controller.takePictureAndSaveLocally(
                      controller.cameraController,
                    );
                  },
                  onProfileTap: () {},
                ),
                AdBannerWidget(),
              ],
            ),
          ],
        );
      }),
    );
  }
}
