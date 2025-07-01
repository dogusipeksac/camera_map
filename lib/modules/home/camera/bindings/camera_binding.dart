import 'package:get/get.dart';

import '../../topbar/flash/binding/flash_binding.dart';
import '../controllers/camera_controller.dart';
class CameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CameraController());
    FlashBinding().dependencies();
  }
}
