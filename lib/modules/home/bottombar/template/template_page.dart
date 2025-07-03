import 'package:camera_map/modules/home/bottombar/template/controller/template_controller.dart';
import 'package:camera_map/modules/home/bottombar/template/template_item_widget.dart';
import 'package:camera_map/modules/home/bottombar/template/enum/template_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../banner/ad_banner_widget.dart';

class TemplatePage extends GetView<TemplateController> {
  const TemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text('template_title'.tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  TemplateItem(
                    title: 'advance_template'.tr,
                    type: TemplateType.advance,
                    isSelected: controller.selectedTemplate.value == TemplateType.advance,
                    onTap: () => controller.selectTemplate(TemplateType.advance),
                  ),
                  const SizedBox(height: 16),
                  TemplateItem(
                    title: 'classic_template'.tr,
                    type: TemplateType.classic,
                    isSelected: controller.selectedTemplate.value == TemplateType.classic,
                    onTap: () => controller.selectTemplate(TemplateType.classic),
                  ),
                  const SizedBox(height: 16),
                  TemplateItem(
                    title: 'reporting_template'.tr,
                    type: TemplateType.reporting,
                    isSelected: controller.selectedTemplate.value == TemplateType.reporting,
                    showCheckIn: true,
                    onTap: () => controller.selectTemplate(TemplateType.reporting),
                  ),
                ],
              );
            }),
          ),
          const AdBannerWidget(),
        ],
      ),
    );
  }
}
