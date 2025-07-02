import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool watermarkEnabled = false.obs;

  void toggleWatermark(bool value) {
    watermarkEnabled.value = value;
  }
}
