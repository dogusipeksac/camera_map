import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final VoidCallback? onAspectRatioTap;
  const TopBar({super.key, this.onAspectRatioTap});

  @override
  Widget build(BuildContext context) {
    // 🔷 Top Bar
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16,left: 16,right: 16,top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.aspect_ratio, color: Colors.white),
              onPressed: onAspectRatioTap,
            ),
            Icon(Icons.flash_on, color: Colors.white),
            Icon(Icons.add_photo_alternate_outlined, color: Colors.white),
            Icon(Icons.flip_camera_android, color: Colors.white),
            Icon(Icons.settings, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
