
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_routes.dart';

class TemplateWidget extends StatelessWidget {
  const TemplateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:(){
        Get.toNamed(Routes.template);
      },
      icon: const Icon(Icons.grid_on, color: Colors.white),
    );
  }
}
