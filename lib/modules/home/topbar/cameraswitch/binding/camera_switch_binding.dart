import 'package:get/get.dart';
import '../controller/camera_switch_controller.dart';

class CameraSwitchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraSwitchController>(() => CameraSwitchController());
  }
}
