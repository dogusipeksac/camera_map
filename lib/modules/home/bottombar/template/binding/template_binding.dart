import 'package:camera_map/modules/home/bottombar/template/controller/template_controller.dart';
import 'package:get/get.dart';

class TemplateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TemplateController>(() => TemplateController());
  }
}