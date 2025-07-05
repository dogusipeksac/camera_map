import 'package:camera_map/modules/home/bottombar/gallery/lastphoto/last_photo_detail_controller.dart';
import 'package:get/get.dart';

class LastPhotoDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LastPhotoDetailController());
  }
}
