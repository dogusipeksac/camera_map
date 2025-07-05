import 'dart:io';
import 'package:camera/camera.dart' as cam;
import 'package:camera/camera.dart';
import 'package:camera_map/modules/home/bottombar/gallery/lastphoto/last_photo_detail_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/utils/component/app_snackbar.dart';
import '../../topbar/filenameformat/controller/file_name_customize_controller.dart';
import '../../topbar/flash/controller/flash_controller.dart';
import '../../bottombar/folder/folder_controller.dart';

class CameraController extends GetxController {
  late cam.CameraController cameraController;
  RxBool isCameraReady = false.obs;
  RxBool isTakingPicture = false.obs;

  @override
  void onInit() {
    super.onInit();
    initCamera();
  }

  Future<void> initCamera() async {
    try {
      final cameras = await cam.availableCameras();
      if (cameras.isEmpty) {
        AppSnackbar.error("No camera found");
        return;
      }

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

  Future<void> takePictureInSafeMode() async {
    if (!isCameraReady.value || !cameraController.value.isInitialized) {
      AppSnackbar.error("Camera not ready");
      return;
    }

    if (isTakingPicture.value) return;

    isTakingPicture.value = true;

    try {
      final cam.XFile file = await cameraController.takePicture();

      String fallbackPath = '/storage/emulated/0/DCIM/MyCameraApp';
      String savePath = fallbackPath;

      if (Get.isRegistered<FolderController>()) {
        final folderController = Get.find<FolderController>();
        final selected = folderController.selectedFolderPath.value;
        if (selected.isNotEmpty) savePath = selected;
      }

      final Directory saveDir = Directory(savePath);
      if (!await saveDir.exists()) await saveDir.create(recursive: true);

      String fileName = "IMG_${DateTime.now().millisecondsSinceEpoch}.jpg";
      if (Get.isRegistered<FileNameCustomizeController>()) {
        final formatController = Get.find<FileNameCustomizeController>();
        fileName = formatController.fileName.value;
      }

      final File newImage = File('${saveDir.path}/$fileName');
      await File(file.path).copy(newImage.path);

      // ✅ Android galeriye tanıt
      const platform = MethodChannel('media_scanner_channel');
      await platform.invokeMethod('scanFile', {'path': newImage.path});

      AppSnackbar.success("Photo saved to: ${newImage.path}");

      // 📌 Küçük bir gecikme ver → sistemin dosyayı tanıması için
      await Future.delayed(const Duration(milliseconds: 500));

      final XFile xFile = await cameraController.takePicture();
      final File photoFile = File(xFile.path);

      // Şimdi bunu GalleryController'a gönder
      final galleryController = Get.find<LastPhotoDetailController>();
      galleryController.setTakenPhoto(photoFile);

    } catch (e) {
      AppSnackbar.error("Failed to take picture: $e");
    } finally {
      isTakingPicture.value = false;
    }
  }



  @override
  void onClose() {
    if (cameraController.value.isInitialized) {
      cameraController.dispose();
    }
    super.onClose();
  }
}
