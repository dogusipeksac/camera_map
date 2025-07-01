import 'package:camera_map/modules/home/bottombar/folder/view/folder_widget.dart';
import 'package:camera_map/modules/home/bottombar/gallery/view/gallery_widget.dart';
import 'package:camera_map/modules/home/bottombar/map/view/map_widget.dart';
import 'package:camera_map/modules/home/bottombar/takephoto/view/take_photo_widget.dart';
import 'package:camera_map/modules/home/bottombar/template/view/template_widget.dart';
import 'package:camera_map/modules/home/topbar/aspectratio/view/aspect_ratio_widget.dart';
import 'package:camera_map/modules/home/topbar/cameraswitch/view/camera_switch_widget.dart';
import 'package:camera_map/modules/home/topbar/filepath/view/file_path_widget.dart';
import 'package:camera_map/modules/home/topbar/settings/view/settings_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../banner/ad_banner_widget.dart';
import '../../bottombar/bottom_bar.dart';
import '../../bottombar/photogenerate/photo_generate.dart';
import '../../topbar/flash/view/flash_widgets.dart';
import '../../topbar/top_bar.dart';
import '../controllers/camera_controller.dart' as my;

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final my.CameraController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (!controller.isCameraReady.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            TopBar(
              flashWidget: FlashWidgets(),
              aspectRatioWidget: AspectRatioWidget(),
              filePathWidget: FilePathWidget(),
              cameraSwitchWidget: CameraSwitchWidgets(),
              settingsWidget: SettingsWidgets(),
            ),

            const PhotoGenerate(),
            BottomBar(
              galleryWidget: GalleryWidget(),
              mapWidget: MapWidget(),
              cameraWidget: TakePhotoWidget(),
              folderWidget: FolderWidget(),
              templateWidget: TemplateWidget(),
            ),
            const AdBannerWidget(),
          ],
        );
      }),
    );
  }
}
