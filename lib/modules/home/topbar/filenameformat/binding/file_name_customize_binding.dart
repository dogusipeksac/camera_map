import 'package:camera_map/modules/home/topbar/filenameformat/controller/file_name_customize_controller.dart';
import 'package:get/get.dart';

class FileNameCustomizeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FileNameCustomizeController());
  }
}
