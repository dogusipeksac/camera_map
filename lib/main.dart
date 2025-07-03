import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera_map/modules/home/topbar/filenameformat/controller/file_name_customize_controller.dart';
import 'package:camera_map/modules/home/bottombar/folder/folder_controller.dart';
import 'package:camera_map/modules/permission/controllers/permission_controller.dart';
import 'package:camera_map/routes/app_pages.dart';
import 'package:camera_map/routes/app_routes.dart';
import 'package:camera_map/core/utils/localization/translations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Global controllerlar
  Get.put(FolderController(), permanent: true);
  Get.put(FileNameCustomizeController());
  Get.put(PermissionController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Camera Map App',
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: const Locale('tr', 'TR'),
      fallbackLocale: const Locale('tr', 'TR'),
      getPages: AppPages.pages,
      initialRoute: Routes.splash, // 👈 Başlangıç olarak splash
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4C5EFF)),
        useMaterial3: true,
      ),
    );
  }
}
