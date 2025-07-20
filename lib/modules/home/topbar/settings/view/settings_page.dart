import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../banner/ad_banner_widget.dart';
import '../controller/settings_controller.dart';
import 'settings_tile.dart';
import 'package:share_plus/share_plus.dart';

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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'general'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),

                  // 🔹 Ayar seçenekleri
                  SettingsTile(
                    icon: Icons.apps,
                    label: 'more_apps',
                    onTap: () {
                      // Örnek: Diğer uygulamaları gösteren URL
                      launchWebPage('play_store_developer_link'.tr);
                    },
                  ),
                  SettingsTile(
                    icon: Icons.star_border,
                    label: 'rate_app',
                    onTap: () {
                      launchWebPage('play_store_app_link'.tr);
                    },
                  ),
                  SettingsTile(
                    icon: Icons.share,
                    label: 'share_app',
                    onTap: () {
                      Share.share('share_link_explain_url'.tr);
                    },
                  ),
                  SettingsTile(
                    icon: Icons.privacy_tip,
                    label: 'privacy_policy',
                    onTap: () {
                      launchWebPage('privacy_policy_url'.tr);
                    },
                  ),
                  SettingsTile(
                    icon: Icons.description,
                    label: 'terms_conditions',
                    onTap: () {
                      launchWebPage('terms_policy_url'.tr);
                    },
                  ),


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

  Future<void> launchWebPage(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'url_not_found'.tr + url;
    }
  }

}





