
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../banner/ad_banner_widget.dart';
import '../../bottombar/bottom_bar.dart';
import '../../bottombar/photogenerate/photo_generate.dart';
import '../../topbar/top_bar.dart';
import '../controllers/camera_controller.dart' as my;


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
