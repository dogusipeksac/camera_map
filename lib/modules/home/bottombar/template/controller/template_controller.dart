import 'package:camera_map/modules/home/bottombar/template/enum/template_type.dart';
import 'package:get/get.dart';

class TemplateController extends GetxController {
  Rx<TemplateType> selectedTemplate = TemplateType.reporting.obs;

  void selectTemplate(TemplateType type) {
    selectedTemplate.value = type;
  }
}