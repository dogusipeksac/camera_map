import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'gallery_detail_controller.dart';

class GalleryDetailPage extends GetView<GalleryDetailController> {
  const GalleryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Photo Detail")),
      body: Center(
        child: Image.file(controller.selectedImage),
      ),
    );
  }
}
