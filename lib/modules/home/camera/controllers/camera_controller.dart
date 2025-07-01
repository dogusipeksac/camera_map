import 'dart:io';

import 'package:camera/camera.dart' as cam;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../topbar/flash/controller/flash_controller.dart';

class CameraController extends GetxController {
  late cam.CameraController cameraController;
  RxBool isCameraReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    initCamera();
  }

  Future<void> initCamera() async {
    try {
      final cameras = await cam.availableCameras();
      cameraController = cam.CameraController(
        cameras.first,
        cam.ResolutionPreset.high,
        enableAudio: false,
      );
      await cameraController.initialize();
      Get.find<FlashController>().attachCamera(cameraController);
      isCameraReady.value = true;
    } catch (e) {
      isCameraReady.value = false;
      Get.snackbar("Camera Error", "Camera init failed: $e");
    }
  }

  Future<String?> takePictureAndSaveLocally(
    cam.CameraController controller,
  ) async {
    try {
      final cam.XFile file = await controller.takePicture();

      final Directory baseDir = Directory(
        '/storage/emulated/0/Pictures/MyCameraApp',
      );
      if (!await baseDir.exists()) {
        await baseDir.create(recursive: true);
      }

      final String fileName =
          'IMG_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final File newImage = File('${baseDir.path}/$fileName');
      await File(file.path).copy(newImage.path);

      // 📢 Galeriye bildir
      const platform = MethodChannel('media_scanner_channel');
      await platform.invokeMethod('scanFile', {'path': newImage.path});

      Get.snackbar(
        "Saved",
        "Photo saved to ${newImage.path}",
        backgroundColor: Colors.white,
      );
      return newImage.path;
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
      return null;
    }
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
