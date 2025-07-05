import 'package:get/get.dart';
import 'gallery_detail_controller.dart';

class GalleryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GalleryDetailController());
  }
}
