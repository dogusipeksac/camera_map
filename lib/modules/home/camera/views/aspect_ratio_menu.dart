import 'package:camera/camera.dart' as my;
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AspectRatioMenu extends StatelessWidget {
  const AspectRatioMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final my.CameraController controller = Get.find();

    return Positioned(
      top: 70,
      left: 16,
      right: 16,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.85),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          return Row();
        }),
      ),
    );
  }

  Widget _buildOption(
      BuildContext context, {
        required String label,
        required double ratio,
        required double selectedRatio,
        required my.CameraController controller,
      }) {
    final bool isSelected = ratio == selectedRatio;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        //controller.setAspectRatio(ratio);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white24 : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white24,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              Icons.aspect_ratio,
              color: isSelected ? Colors.white : Colors.white70,
              size: 28,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
