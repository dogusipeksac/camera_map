import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        'banner_text'.tr,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
