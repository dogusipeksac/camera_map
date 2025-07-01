import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import '../../flash/controller/flash_controller.dart'; // 📍 path'i senin dizinine göre ayarladım

class FlashModeMenu extends StatelessWidget {
  const FlashModeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final flashController = Get.find<FlashController>();

    return Positioned(
      top: 70,
      right: 80,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.85),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 10,
              ),
            ],
          ),
          child: Obx(() {
            final current = flashController.flashMode.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: FlashMode.values.map((mode) {
                final label = _getLabel(mode);
                final isSelected = current == mode;

                return InkWell(
                  onTap: () async {
                    await flashController.setFlashMode(mode);
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          label,
                          style: TextStyle(
                            color: isSelected ? Colors.amber : Colors.white,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                        if (isSelected)
                          const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(Icons.check, size: 16, color: Colors.amber),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }),
        ),
      ),
    );
  }

  String _getLabel(FlashMode mode) {
    switch (mode) {
      case FlashMode.auto:
        return "Auto";
      case FlashMode.always:
        return "Always";
      case FlashMode.torch:
        return "Torch";
      case FlashMode.off:
      default:
        return "Off";
    }
  }
}
