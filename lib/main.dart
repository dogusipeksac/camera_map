import 'package:camera_map/modules/home/topbar/filenameformat/controller/file_name_customize_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/utils/localization/translations.dart';
import 'modules/home/bottombar/folder/folder_controller.dart';
import 'modules/permission/controllers/permission_controller.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Klasör seçimini global olarak saklayacak controller
  Get.put(FolderController(), permanent: true);
  Get.put(FileNameCustomizeController());

  // ✅ İzin kontrolü için controller
  final permissionController = Get.put(PermissionController());

  // ✅ Gerekli tüm izinler verildiyse kamera ekranına yönlendir
  final allGranted = await permissionController.checkAllPermissions();

  runApp(MyApp(
    initialRoute: allGranted ? Routes.camera : Routes.permission,
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Camera Map App',
      debugShowCheckedModeBanner: false,

      // ✅ Çoklu dil desteği
      translations: AppTranslations(),
      locale: const Locale('tr', 'TR'),
      fallbackLocale: const Locale('tr', 'TR'),

      // ✅ GetX rota yönetimi
      getPages: AppPages.pages,
      initialRoute: initialRoute,

      // ✅ Tema ayarı
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4C5EFF)),
        useMaterial3: true,
      ),
    );
  }
}
