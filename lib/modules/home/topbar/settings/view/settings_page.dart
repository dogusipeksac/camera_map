import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../banner/ad_banner_widget.dart';
import '../controller/settings_controller.dart';
import 'settings_tile.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text('settings_title'.tr), // 🌍 Çok dilli destek
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 🔽 Kaydırılabilir içerik
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 🔄 Filigran ayarı
                  Obx(() {
                    return SwitchListTile(
                      value: controller.watermarkEnabled.value,
                      onChanged: controller.toggleWatermark,
                      title: Text('watermark'.tr),
                      secondary: const Icon(Icons.soap),
                    );
                  }),

                  // 🔖 Genel başlık
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'general'.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),

                  // 🔹 Ayar seçenekleri
                  const SettingsTile(icon: Icons.apps, label: 'more_apps'),
                  const SettingsTile(icon: Icons.star_border, label: 'rate_app'),
                  const SettingsTile(icon: Icons.share, label: 'share_app'),
                  const SettingsTile(icon: Icons.privacy_tip, label: 'privacy_policy'),
                  const SettingsTile(icon: Icons.description, label: 'terms_conditions'),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // 📢 Sabit reklam alanı
          const AdBannerWidget(),
        ],
      ),
    );
  }
}
