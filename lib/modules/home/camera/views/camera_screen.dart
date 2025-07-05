import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../banner/ad_banner_widget.dart';
import '../../bottombar/bottom_bar.dart';
import '../../bottombar/bottom_bar_item_type.dart';
import '../../bottombar/folder/view/folder_widget.dart';
import '../../bottombar/gallery/lastphoto/view/gallery_widget.dart';
import '../../bottombar/map/view/map_widget.dart';
import '../../bottombar/photogenerate/photo_generate.dart';
import '../../bottombar/takephoto/view/take_photo_widget.dart';
import '../../bottombar/template/view/template_widget.dart';
import '../../topbar/aspectratio/controllers/camera_settings_controller.dart';
import '../../topbar/aspectratio/view/aspect_ratio_widget.dart';
import '../../topbar/aspectratio/view/camera_settings_panel.dart';
import '../../topbar/cameraswitch/view/camera_switch_widget.dart';
import '../../topbar/filenameformat/view/file_name_customize_widget.dart';
import '../../topbar/flash/view/flash_widgets.dart';
import '../../topbar/settings/view/settings_widgets.dart';
import '../../topbar/top_bar.dart';
import '../../topbar/top_bar_item_type.dart';
import '../controllers/camera_controller.dart' as my;

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final my.CameraController controller = Get.find();
    final settingsController = Get.put(CameraSettingsController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (!controller.isCameraReady.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            // 1️⃣ Ana kamera içeriği
            Column(
              children: [
                TopBar(
                  items: [
                    //TopBarItemType.aspectRatio,
                    TopBarItemType.flash,
                    TopBarItemType.filePath,
                    //TopBarItemType.cameraSwitch,
                    TopBarItemType.settings,
                  ],
                  widgets: {
                    TopBarItemType.aspectRatio: AspectRatioWidget(),
                    TopBarItemType.flash: FlashWidgets(),
                    TopBarItemType.filePath: FileNameCustomizeWidget(),
                    TopBarItemType.cameraSwitch: CameraSwitchWidgets(),
                    TopBarItemType.settings: SettingsWidgets(),
                  },
                ),

                const PhotoGenerate(),
                BottomBar(
                  items: [
                    BottomBarItemType.gallery,
                    BottomBarItemType.map,
                    BottomBarItemType.camera,
                    BottomBarItemType.folder,
                    BottomBarItemType.template,
                  ],
                  widgets: {
                    BottomBarItemType.gallery: GalleryWidget(),
                    BottomBarItemType.map: MapWidget(),
                    BottomBarItemType.camera: TakePhotoWidget(),
                    BottomBarItemType.folder: FolderWidget(),
                    BottomBarItemType.template: TemplateWidget(),
                  },
                ),
                const AdBannerWidget(),
              ],
            ),

            // 2️⃣ Dışarı tıklanınca paneli kapat
            Obx(() {
              return settingsController.isSettingsPanelVisible.value
                  ? Positioned.fill(
                child: GestureDetector(
                  onTap: settingsController.closePanel,
                  behavior: HitTestBehavior.translucent,
                  child: Container(),
                ),
              )
                  : const SizedBox.shrink();
            }),

            // 3️⃣ Ayar paneli (TopBar altında görünür)
            Obx(() {
              return settingsController.isSettingsPanelVisible.value
                  ? Positioned(
                top: 50, // TopBar yüksekliği kadar offset
                left: 0,
                right: 0,
                child: const CameraSettingsPanel(),
              )
                  : const SizedBox.shrink();
            }),
          ],
        );
      }),
    );
  }
}
