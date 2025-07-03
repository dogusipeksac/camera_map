import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../routes/app_routes.dart';
import '../../permission/controllers/permission_controller.dart';

class SplashController extends GetxController {
  final _permissionController = Get.find<PermissionController>();

  @override
  void onInit() {
    super.onInit();
    _navigateNext();
  }

  void _navigateNext() async {
    await Future.delayed(const Duration(seconds: 3));
    final granted = await _permissionController.checkAllPermissions();

    if (granted) {
      Get.offAllNamed(Routes.camera);
    } else {
      Get.offAllNamed(Routes.permission);
    }
  }

  Future<String> getAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    return "${info.version}+${info.buildNumber}";
  }
}
