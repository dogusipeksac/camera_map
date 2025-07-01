import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraSwitchController extends GetxController {
  late CameraController cameraController;
  late List<CameraDescription> cameras;
  RxBool isCameraReady = false.obs;
  RxInt selectedCameraIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initCamera();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    await _startCamera(selectedCameraIndex.value);
  }

  Future<void> _startCamera(int index) async {
    cameraController = CameraController(
      cameras[index],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize();
    isCameraReady.value = true;
  }

  Future<void> switchCamera() async {
    isCameraReady.value = false;
    selectedCameraIndex.value = selectedCameraIndex.value == 0 ? 1 : 0;

    await cameraController.dispose();
    await _startCamera(selectedCameraIndex.value);
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
