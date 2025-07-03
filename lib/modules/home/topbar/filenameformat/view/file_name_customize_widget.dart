import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_routes.dart';

class FileNameCustomizeWidget extends StatelessWidget {
  const FileNameCustomizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add_photo_alternate_outlined, color: Colors.white),
      onPressed: () {
        Get.toNamed(Routes.fileName);
      },
    );
  }
}
