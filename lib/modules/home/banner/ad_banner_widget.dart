import 'package:flutter/material.dart';

class AdBannerWidget extends StatelessWidget {
  const AdBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 48,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        '📢 This is a banner ad',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
