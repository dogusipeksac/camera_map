
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/camera_controller.dart' as my;

class AspectRatioMenu extends StatelessWidget {
  const AspectRatioMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final my.CameraController controller = Get.find();

    return Positioned(
      top: 70,
      left: 16,
      right: 16,
      child: Card(
        color: Colors.black.withOpacity(0.85),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              _buildOption("4:3", 3 / 4, controller),
              _buildOption("16:9", 9 / 16, controller),
              _buildOption("1:1", 1.0, controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String label, double ratio, my.CameraController controller) {
    return GestureDetector(
      onTap: () {
        controller.setAspectRatio(ratio);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.aspect_ratio, color: Colors.white),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
