// lib/modules/home/topbar/flash/binding/flash_binding.dart

import 'package:get/get.dart';
import '../controller/flash_controller.dart';

class FlashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FlashController());
  }
}
