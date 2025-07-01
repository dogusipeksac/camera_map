import 'package:get/get.dart';

import '../../topbar/cameraswitch/controller/camera_switch_controller.dart';
import '../../topbar/flash/controller/flash_controller.dart';
import '../controllers/camera_controller.dart';

class CameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CameraController());
    Get.lazyPut(() => FlashController());
    Get.lazyPut(() => CameraSwitchController());
  }
}
