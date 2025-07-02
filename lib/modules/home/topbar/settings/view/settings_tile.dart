
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const SettingsTile({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(label.tr),
      onTap: () {
        // Tıklanınca yapılacak işlem
      },
    );
  }
}