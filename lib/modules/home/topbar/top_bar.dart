import 'package:flutter/material.dart';


class TopBar extends StatelessWidget {
  final Widget? aspectRatioWidget;
  final Widget? filePathWidget;
  final Widget? settingsWidget;
  final Widget? flashWidget;
  final Widget? cameraSwitchWidget;

  const TopBar({
    super.key,
    this.aspectRatioWidget,
    this.filePathWidget,
    this.settingsWidget,
    this.flashWidget,
    this.cameraSwitchWidget,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            aspectRatioWidget ?? const SizedBox(width: 48),
            flashWidget ?? const SizedBox(width: 48),
            filePathWidget ?? const SizedBox(width: 48),
            cameraSwitchWidget ?? const SizedBox(width: 48),
            settingsWidget ?? const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }
}
