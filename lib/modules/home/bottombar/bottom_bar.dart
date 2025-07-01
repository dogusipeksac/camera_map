import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback? onProfileTap;
  final VoidCallback? onMapTap;
  final VoidCallback? onCameraTap;
  final VoidCallback? onFolderTap;
  final VoidCallback? onGridTap;

  const BottomBar({
    super.key,
    this.onProfileTap,
    this.onMapTap,
    this.onCameraTap,
    this.onFolderTap,
    this.onGridTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onProfileTap,
            icon: const Icon(Icons.account_circle, color: Colors.white),
          ),
          IconButton(
            onPressed: onMapTap,
            icon: const Icon(Icons.map, color: Colors.white),
          ),
          SizedBox(
            width: 72,
            height: 72,
            child: IconButton(
              onPressed: onCameraTap,
              icon: const Icon(Icons.camera_alt, color: Colors.white, size: 72),
            ),
          ),
          IconButton(
            onPressed: onFolderTap,
            icon: const Icon(Icons.folder_open, color: Colors.white),
          ),
          IconButton(
            onPressed: onGridTap,
            icon: const Icon(Icons.grid_on, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
