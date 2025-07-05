import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../camera/controllers/camera_controller.dart' as my;

class TakePhotoWidget extends StatelessWidget {
  const TakePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<my.CameraController>();

    return SizedBox(
      width: 72,
      height: 72,
      child: IconButton(
        onPressed: () async {
          await controller.takePictureInSafeMode();
        },
        icon: const Icon(Icons.camera_alt, color: Colors.white, size: 72),
      ),
    );
  }
}
