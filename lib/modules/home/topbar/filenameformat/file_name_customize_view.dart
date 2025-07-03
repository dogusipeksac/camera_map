import 'package:camera_map/modules/home/banner/ad_banner_widget.dart';
import 'package:camera_map/modules/home/topbar/filenameformat/controller/file_name_customize_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileNameCustomizeView extends GetView<FileNameCustomizeController> {
  const FileNameCustomizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('file_name_title'.tr)),
      body: Column(
        children: [
          // 📸 Önizleme alanı
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Obx(() => Center(
              child: Text(
                controller.fileName.value,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            )),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'file_name_description'.tr,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 12),

          // 🧩 Sıralanabilir alanlar
          Expanded(
            child: Obx(() {
              return ReorderableListView.builder(
                itemCount: controller.parts.length,
                onReorder: controller.reorder,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final part = controller.parts[index];

                  return Card(
                    key: ValueKey(part.type),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 1,
                    child: ListTile(
                      leading: Checkbox(
                        value: part.enabled,
                        onChanged: part.type == FileNamePartType.dateTime
                            ? null
                            : (_) => controller.toggle(part),
                      ),
                      title: Text(
                        controller.getPartLabel(part.type).tr,
                        style: const TextStyle(fontSize: 15),
                      ),
                      trailing: const Icon(Icons.drag_indicator),
                    ),
                  );
                },
              );
            }),
          ),
          const SizedBox(height: 8),
          const AdBannerWidget()
        ],
      ),
    );
  }
}
