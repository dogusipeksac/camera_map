import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccessTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final RxBool valueRx;
  final void Function(bool) onChanged;

  const AccessTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.valueRx,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F7FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(
            () => SwitchListTile(
          secondary: Icon(icon, color: Colors.orange),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle),
          value: valueRx.value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
