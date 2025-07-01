import 'package:camera/camera.dart';
import 'package:get/get.dart';

class FlashController extends GetxController {
  final Rx<FlashMode> flashMode = FlashMode.off.obs;
  CameraController? cameraController;

  void attachCamera(CameraController controller) {
    cameraController = controller;
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (cameraController == null || !cameraController!.value.isInitialized) return;

    try {
      await cameraController!.setFlashMode(mode);
      flashMode.value = mode;
    } catch (e) {
      Get.snackbar("Unsupported", "This flash mode is not supported on your device");
    }
  }

  Future<void> toggleFlash() async {
    final isTorch = flashMode.value == FlashMode.torch;
    await setFlashMode(isTorch ? FlashMode.off : FlashMode.torch);
  }
}
