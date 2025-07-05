import 'package:flutter/material.dart';
import 'bottom_bar_item_type.dart'; // Enum dosyasını burada tutabilirsin

class BottomBar extends StatelessWidget {
  final List<BottomBarItemType> items;
  final Map<BottomBarItemType, Widget> widgets;

  const BottomBar({
    super.key,
    required this.items,
    required this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((item) {
            return widgets[item] ?? const SizedBox(width: 48);
          }).toList(),
        ),
      ),
    );
  }
}
