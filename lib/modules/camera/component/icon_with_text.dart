

import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconWithText({required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.white),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 10)),
      ],
    );
  }
}
