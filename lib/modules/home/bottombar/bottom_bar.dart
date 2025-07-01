import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Widget? galleryWidget;
  final Widget? mapWidget;
  final Widget? cameraWidget;
  final Widget? folderWidget;
  final Widget? templateWidget;

  const BottomBar({
    super.key,
    this.galleryWidget,
    this.mapWidget,
    this.cameraWidget,
    this.folderWidget,
    this.templateWidget,
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
          galleryWidget ?? const SizedBox(width: 48),
          mapWidget ?? const SizedBox(width: 48),
          cameraWidget ?? const SizedBox(width: 48),
          folderWidget ?? const SizedBox(width: 48),
          templateWidget ?? const SizedBox(width: 48),
        ],
      ),
    );
  }
}
