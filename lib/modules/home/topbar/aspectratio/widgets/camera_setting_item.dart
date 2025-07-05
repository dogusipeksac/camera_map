import 'package:flutter/material.dart';
import '../enum/camera_setting_type.dart';

class CameraSettingItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final CameraSettingType type;
  final VoidCallback onTap;
  final bool isSelected;

  const CameraSettingItem({
    super.key,
    required this.icon,
    required this.label,
    required this.type,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? Colors.blueAccent : Colors.transparent,
                width: 1.5,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 24,
              color: isSelected ? Colors.blueAccent : Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blueAccent : Colors.white,
              fontSize: 11,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
