import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../enum/camera_setting_type.dart';
import '../widgets/camera_setting_item.dart';
import '../controllers/camera_settings_controller.dart';

class CameraSettingsPanel extends StatelessWidget {
  const CameraSettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CameraSettingsController>();

    final List<CameraSettingType> items = [
      CameraSettingType.ratio,
      CameraSettingType.mirror,
      CameraSettingType.sound,
      CameraSettingType.whiteBalance,
      CameraSettingType.sceneMode,
      CameraSettingType.cameraLevel,
    ];

    return Container(
      color: Colors.black.withOpacity(0.8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Obx(() {
        final settingMap = {
          CameraSettingType.ratio: CameraSettingItem(
            icon: Icons.aspect_ratio,
            label: 'Ratio (${controller.currentRatio.value})',
            type: CameraSettingType.ratio,
            onTap: controller.toggleRatio,
            isSelected: controller.currentRatio.value == "16:9",
          ),
          CameraSettingType.mirror: CameraSettingItem(
            icon: Icons.flip_camera_android_outlined,
            label: controller.isMirrored.value ? 'Mirror On' : 'Mirror Off',
            type: CameraSettingType.mirror,
            onTap: controller.toggleMirror,
            isSelected: controller.isMirrored.value,
          ),
          CameraSettingType.sound: CameraSettingItem(
            icon: Icons.volume_up,
            label: controller.isSoundOn.value ? 'Sound On' : 'Sound Off',
            type: CameraSettingType.sound,
            onTap: controller.toggleSound,
            isSelected: controller.isSoundOn.value,
          ),
          CameraSettingType.whiteBalance: CameraSettingItem(
            icon: Icons.thermostat_auto_outlined,
            label: controller.whiteBalanceModes[controller.currentWhiteBalanceIndex.value],
            type: CameraSettingType.whiteBalance,
            onTap: controller.cycleWhiteBalance,
            isSelected: controller.currentWhiteBalanceIndex.value != 0,
          ),
          CameraSettingType.sceneMode: CameraSettingItem(
            icon: Icons.photo_filter_outlined,
            label: controller.sceneModes[controller.currentSceneModeIndex.value],
            type: CameraSettingType.sceneMode,
            onTap: controller.cycleSceneMode,
            isSelected: controller.currentSceneModeIndex.value != 0,
          ),
          CameraSettingType.cameraLevel: CameraSettingItem(
            icon: Icons.straighten_outlined,
            label: controller.isLevelVisible.value ? 'Level On' : 'Level Off',
            type: CameraSettingType.cameraLevel,
            onTap: controller.toggleLevel,
            isSelected: controller.isLevelVisible.value,
          ),
        };

        return GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          physics: const NeverScrollableScrollPhysics(),
          children: items.map((type) => settingMap[type]!).toList(),
        );
      }),
    );
  }
}
