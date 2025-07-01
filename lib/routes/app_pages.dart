import 'package:get/get.dart';
import '../modules/camera/bindings/camera_binding.dart';
import '../modules/camera/views/camera_screen.dart';
import '../modules/permission/bindings/permission_binding.dart';
import '../modules/permission/views/permission_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final pages = [
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
  ];
}
