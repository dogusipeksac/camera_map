import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_routes.dart';
class FolderWidget extends StatelessWidget {
  const FolderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      onPressed: (){  Get.toNamed(Routes.folders);},
      icon: const Icon(Icons.folder_open, color: Colors.white),
    );
  }
}
