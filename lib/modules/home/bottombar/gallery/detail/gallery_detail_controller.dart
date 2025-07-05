import 'dart:io';
import 'package:get/get.dart';

class GalleryDetailController extends GetxController {
  late File selectedImage;

  @override
  void onInit() {
    selectedImage = Get.arguments as File;
    super.onInit();
  }
}
