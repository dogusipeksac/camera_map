import 'dart:io';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class LastPhotoDetailController extends GetxController {
  RxList<File> allPhotos = <File>[].obs;
  Rx<File?> latestPhoto = Rx<File?>(null);
  Rx<File?> takenPhoto = Rx<File?>(null); // 📸 Uygulama üzerinden çekilen son fotoğraf

  @override
  void onInit() {
    super.onInit();
    loadLatestPhoto();
  }

  void setTakenPhoto(File file) {
    takenPhoto.value = file;
    latestPhoto.value = file;
  }

  Future<void> loadLatestPhoto() async {
    if (takenPhoto.value != null) {
      latestPhoto.value = takenPhoto.value;
      return;
    }

    final albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      filterOption: FilterOptionGroup(
        orders: [const OrderOption(type: OrderOptionType.createDate, asc: false)],
      ),
    );

    if (albums.isNotEmpty) {
      final recentAlbum = albums.first;
      final recentAssets = await recentAlbum.getAssetListRange(start: 0, end: 1); // sadece 1 tane

      final files = await Future.wait(
        recentAssets.map((e) async => await e.file).where((file) => file != null),
      );

      final validFiles = files.whereType<File>().toList();

      if (validFiles.isNotEmpty) {
        latestPhoto.value = validFiles.first;
      }
    }
  }
}
