import 'package:camera_map/modules/home/banner/ad_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'folder_controller.dart';

class FolderPage extends StatelessWidget {
  final FolderController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Folder'),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          Obx(() {
            return SwitchListTile(
              title: const Text("Save Original Photos"),
              value: controller.saveOriginalPhotos.value,
              onChanged: controller.toggleSaveOriginal,
            );
          }),

          Expanded(
            child: Obx(() {
              final folders = controller.folders;
              final selectedPath = controller.selectedFolderPath.value;

              return ListView.builder(
                itemCount: folders.length,
                itemBuilder: (context, index) {
                  final folderPath = folders[index];
                  final folderName = folderPath.split('/').last;
                  final isSelected = folderPath == selectedPath;

                  return ListTile(
                    leading: const Icon(Icons.folder, color: Colors.orange),
                    title: Text(folderName),
                    trailing: isSelected
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : null,
                    onTap: () => controller.selectFolder(folderPath),
                  );
                },
              );
            }),
          ),

          const AdBannerWidget(),
        ],
      ),
    );
  }
}
