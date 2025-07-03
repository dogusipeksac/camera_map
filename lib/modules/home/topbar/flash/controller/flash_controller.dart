import 'package:camera/camera.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/component/app_snackbar.dart'; // yolunu projenin yapısına göre düzenle

class FlashController extends GetxController {
  final Rx<FlashMode> flashMode = FlashMode.off.obs;
  CameraController? cameraController;

  /// Kamerayı bağla
  void attachCamera(CameraController controller) {
    cameraController = controller;
    flashMode.value = controller.value.flashMode;
  }

  /// Flash modunu ayarla
  Future<void> setFlashMode(FlashMode mode) async {
    if (cameraController == null) {
      AppSnackbar.error("Camera not initialized.");
      return;
    }

    if (!cameraController!.value.isInitialized) {
      AppSnackbar.error("Camera is not ready.");
      return;
    }

    try {
      await cameraController!.setFlashMode(mode);
      flashMode.value = mode;
    } catch (e) {
      AppSnackbar.error("This flash mode is not supported on your device.");
    }
  }

  /// Mevcut moda göre torch on/off geçişi
  Future<void> toggleFlash() async {
    final isTorch = flashMode.value == FlashMode.torch;
    await setFlashMode(isTorch ? FlashMode.off : FlashMode.torch);
  }
}
