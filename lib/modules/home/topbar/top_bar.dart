import 'package:camera_map/modules/home/topbar/top_bar_item_type.dart';
import 'package:flutter/material.dart';


class TopBar extends StatelessWidget {
  final List<TopBarItemType> items;
  final Map<TopBarItemType, Widget> widgets;

  const TopBar({
    super.key,
    required this.items,
    required this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
