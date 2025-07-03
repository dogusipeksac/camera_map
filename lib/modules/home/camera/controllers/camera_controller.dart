import 'dart:io';
import 'package:camera/camera.dart' as cam;
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/utils/component/app_snackbar.dart';
import '../../topbar/filenameformat/controller/file_name_customize_controller.dart';
import '../../topbar/flash/controller/flash_controller.dart';
import '../../bottombar/folder/folder_controller.dart';

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

      if (Get.isRegistered<FlashController>()) {
        Get.find<FlashController>().attachCamera(cameraController);
      }

      isCameraReady.value = true;
    } catch (e) {
      isCameraReady.value = false;
      AppSnackbar.error("Camera init failed: $e");
    }
  }

  Future<String?> takePictureAndSaveLocally(cam.CameraController controller) async {
    try {
      final cam.XFile file = await controller.takePicture();

      // ✅ Kayıt yolu
      String fallbackPath = '/storage/emulated/0/DCIM/MyCameraApp';
      String savePath = fallbackPath;

      if (Get.isRegistered<FolderController>()) {
        final folderController = Get.find<FolderController>();
        final selected = folderController.selectedFolderPath.value;
        if (selected.isNotEmpty) savePath = selected;
      }

      final Directory saveDir = Directory(savePath);
      if (!await saveDir.exists()) await saveDir.create(recursive: true);

      // ✅ Dosya adı formatını al
      String fileName = "IMG_${DateTime.now().millisecondsSinceEpoch}.jpg"; // fallback
      if (Get.isRegistered<FileNameCustomizeController>()) {
        final formatController = Get.find<FileNameCustomizeController>();
        fileName = formatController.fileName.value;
      }

      final File newImage = File('${saveDir.path}/$fileName');
      await File(file.path).copy(newImage.path);

      // 📢 Galeriye bildir
      const platform = MethodChannel('media_scanner_channel');
      await platform.invokeMethod('scanFile', {'path': newImage.path});

      AppSnackbar.success("Photo saved to: ${newImage.path}");
      return newImage.path;
    } catch (e) {
      AppSnackbar.error("Failed to save photo:\n$e");
      return null;
    }
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
