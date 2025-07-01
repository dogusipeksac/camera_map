import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../controllers/camera_controller.dart' as my;
import '../../component/info_overlay.dart';

class PhotoGenerate extends StatelessWidget {
  const PhotoGenerate({super.key});

  @override
  Widget build(BuildContext context) {
    final my.CameraController controller = Get.find();
    return Expanded(
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 6 / 9,
            child: CameraPreview(controller.cameraController),
          ),
          //const CameraOverlayInfoCard(), // Info Overlay
        ],
      ),
    );
  }
}
