import 'package:camera_map/modules/home/topbar/filenameformat/file_name_customize_view.dart';
import 'package:get/get.dart';

import '../modules/home/bottombar/folder/folder_binding.dart';
import '../modules/home/bottombar/folder/folder_page.dart';
import '../modules/home/bottombar/template/binding/template_binding.dart';
import '../modules/home/bottombar/template/template_page.dart';
import '../modules/home/camera/bindings/camera_binding.dart';
import '../modules/home/camera/views/camera_screen.dart';
import '../modules/home/topbar/filenameformat/binding/file_name_customize_binding.dart';
import '../modules/home/topbar/settings/binding/settings_binding.dart';
import '../modules/home/topbar/settings/view/settings_page.dart';
import '../modules/permission/bindings/permission_binding.dart';
import '../modules/permission/views/permission_view.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.permission,
      page: () => const PermissionView(),
      binding: PermissionBinding(),
    ),
    GetPage(
      name: Routes.camera,
      page: () => const CameraScreen(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsPage(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.template,
      page: () => const TemplatePage(),
      binding: TemplateBinding(),
    ),
    GetPage(
      name: Routes.folders,
      page: () => FolderPage(),
      binding: FolderBinding(),
    ),
    GetPage(
      name: Routes.fileName,
      page: () => const FileNameCustomizeView(),
      binding: FileNameCustomizeBinding(),
    )
  ];
}
