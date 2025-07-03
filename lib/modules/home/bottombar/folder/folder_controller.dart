import 'dart:io';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FolderController extends GetxController {
  var folders = <String>[].obs;
  var selectedFolderPath = ''.obs;
  var saveOriginalPhotos = false.obs;

  static const String selectedFolderKey = "selected_folder_path";

  @override
  void onInit() {
    super.onInit();
    loadFoldersFromStorage();
  }

  Future<void> loadFoldersFromStorage() async {
    final rootDir = Directory('/storage/emulated/0/DCIM');
    if (await rootDir.exists()) {
      final entries = rootDir.listSync();
      final folderPaths = entries
          .whereType<Directory>()
          .map((dir) => dir.path)
          .toList();

      // 🔠 Klasörleri alfabetik sırala (son dizin adına göre)
      folderPaths.sort((a, b) =>
          a.split('/').last.toLowerCase().compareTo(b.split('/').last.toLowerCase())
      );

      folders.assignAll(folderPaths);

      // ✅ SharedPreferences'tan önceki seçimi al
      final prefs = await SharedPreferences.getInstance();
      final savedPath = prefs.getString(selectedFolderKey);

      if (savedPath != null && folderPaths.contains(savedPath)) {
        selectedFolderPath.value = savedPath;
      } else if (folderPaths.isNotEmpty) {
        selectedFolderPath.value = folderPaths.first;
      }
    }
  }


  Future<void> selectFolder(String folderPath) async {
    selectedFolderPath.value = folderPath;

    // ✅ SharedPreferences'a kaydet
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(selectedFolderKey, folderPath);
  }

  void toggleSaveOriginal(bool value) {
    saveOriginalPhotos.value = value;
  }
}
