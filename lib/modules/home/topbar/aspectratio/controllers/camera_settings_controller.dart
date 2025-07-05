import 'package:get/get.dart';

class CameraSettingsController extends GetxController {
  // Panel görünürlük durumu
  final RxBool isSettingsPanelVisible = false.obs;

  void togglePanel() => isSettingsPanelVisible.toggle();
  void closePanel() => isSettingsPanelVisible.value = false;

  // ✅ Kamera ayarları
  final RxBool isMirrored = false.obs;
  final RxBool isSoundOn = true.obs;
  final RxBool isLevelVisible = true.obs;

  final RxString currentRatio = "4:3".obs;
  final List<String> availableRatios = ["4:3", "16:9"];

  final List<String> whiteBalanceModes = ["Auto", "Incandescent", "Daylight"];
  final RxInt currentWhiteBalanceIndex = 0.obs;

  final List<String> sceneModes = ["Auto", "Night", "Portrait"];
  final RxInt currentSceneModeIndex = 0.obs;

  // 🔁 Ratio toggle
  void toggleRatio() {
    currentRatio.value = currentRatio.value == "4:3" ? "16:9" : "4:3";
    print("📐 Ratio: ${currentRatio.value}");
    // cameraController üzerinden resolution ayarlanabilir
  }

  // 🔁 Mirror toggle
  void toggleMirror() {
    isMirrored.toggle();
    applyMirrorSetting();
  }

  void applyMirrorSetting() {
    if (isMirrored.value) {
      print("📸 Mirror enabled");
    } else {
      print("📸 Mirror disabled");
    }
    // Preview'a yansımasını istiyorsan yatay çevirme gerekir
  }

  // 🔁 Sound toggle
  void toggleSound() {
    isSoundOn.toggle();
    print("🔈 Sound: ${isSoundOn.value ? 'On' : 'Off'}");
  }

  // 🔁 Level toggle
  void toggleLevel() {
    isLevelVisible.toggle();
    print("📏 Level: ${isLevelVisible.value ? 'On' : 'Off'}");
  }

  // 🔁 White balance döndür
  void cycleWhiteBalance() {
    currentWhiteBalanceIndex.value =
        (currentWhiteBalanceIndex.value + 1) % whiteBalanceModes.length;
    print("🌡 White Balance: ${whiteBalanceModes[currentWhiteBalanceIndex.value]}");
  }

  // 🔁 Scene mode döndür
  void cycleSceneMode() {
    currentSceneModeIndex.value =
        (currentSceneModeIndex.value + 1) % sceneModes.length;
    print("🎬 Scene Mode: ${sceneModes[currentSceneModeIndex.value]}");
  }
}
