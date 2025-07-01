import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  final cameraGranted = false.obs;
  final locationGranted = false.obs;
  final galleryGranted = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkAllPermissions(); // İlk açılışta kontrol
  }

  Future<void> toggleCamera(bool value) async {
    if (value) {
      final status = await Permission.camera.request();
      cameraGranted.value = status.isGranted;
      if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    } else {
      openAppSettings();
    }
  }


  Future<void> toggleLocation(bool value) async {
    if (value) {
      final status = await Permission.location.request();
      locationGranted.value = status.isGranted;
    } else {
      openAppSettings();
    }
  }

  Future<void> toggleGallery(bool value) async {
    if (value) {
      final granted = await _requestGalleryPermission();
      galleryGranted.value = granted;
    } else {
      openAppSettings();
    }
  }

  Future<bool> _requestGalleryPermission() async {
    final sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;

    PermissionStatus status;

    if (sdkInt >= 33) {
      status = await Permission.photos.request(); // Android 13+
    } else {
      status = await Permission.storage.request(); // Android 12 ve altı
    }

    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      Get.snackbar("Permission", "Please allow access from app settings.");
      openAppSettings();
      return false;
    } else if (status.isDenied) {
      Get.snackbar("Permission", "Permission is required to access gallery.");
      return false;
    } else {
      return false;
    }
  }


  Future<bool> checkAllPermissions() async {
    final camStatus = await Permission.camera.status;
    final locStatus = await Permission.location.status;
    final galStatus = await _getGalleryPermissionStatus();

    cameraGranted.value = camStatus.isGranted;
    locationGranted.value = locStatus.isGranted;
    galleryGranted.value = galStatus.isGranted;

    return cameraGranted.value && locationGranted.value && galleryGranted.value;
  }

  Future<PermissionStatus> _getGalleryPermissionStatus() async {
    if (Platform.isAndroid) {
      if (await _isAndroid13OrAbove()) {
        return await Permission.photos.status;
      } else {
        return await Permission.storage.status;
      }
    } else {
      return await Permission.photos.status;
    }
  }

  Future<bool> _isAndroid13OrAbove() async {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    return deviceInfo.version.sdkInt >= 33;
  }
}
