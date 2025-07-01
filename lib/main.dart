import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/utils/localization/translations.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'modules/permission/controllers/permission_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Controller'ı GetX sistemine dahil et
  final permissionController = Get.put(PermissionController());

  // ✅ Tüm izinleri kontrol et
  final allGranted = await permissionController.checkAllPermissions();

  runApp(MyApp(initialRoute: allGranted ? Routes.camera : Routes.permission));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Permission Demo',
      debugShowCheckedModeBanner: false,

      // ✅ Dil desteği ekle
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),

      // ✅ Routing ayarları
      getPages: AppPages.pages,
      initialRoute: initialRoute,

      // ✅ Tema
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4C5EFF)),
        useMaterial3: true,
      ),
    );
  }
}
