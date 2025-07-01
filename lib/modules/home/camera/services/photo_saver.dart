import 'dart:io';
import 'dart:ui' as ui;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> capturePhotoWithInfo({
  required CameraController cameraController,
  required String locationText,
  required String dateTimeText,
  required String temperatureText,
}) async {
  try {
    final XFile photo = await cameraController.takePicture();
    final Uint8List photoBytes = await File(photo.path).readAsBytes();

    final ui.Codec codec = await ui.instantiateImageCodec(photoBytes);
    final ui.FrameInfo frame = await codec.getNextFrame();
    final ui.Image photoImage = frame.image;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint();

    // 📸 Arka plan fotoğrafı
    canvas.drawImage(photoImage, Offset.zero, paint);

    // 📝 Metinleri çizmek için ayarlar
    const double padding = 20;
    const double fontSize = 30;
    final textColor = Colors.white;
    final textShadow = Shadow(blurRadius: 3, color: Colors.black, offset: Offset(1, 1));

    final String fullText = "$locationText\n$dateTimeText\n$temperatureText";

    final textPainter = TextPainter(
      text: TextSpan(
        text: fullText,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          shadows: [textShadow],
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      maxWidth: photoImage.width.toDouble() - (padding * 2),
    );

    // 📦 Arka plan kutusu
    final bgRect = Rect.fromLTWH(
      padding,
      photoImage.height - textPainter.height - padding * 1.5,
      textPainter.width + padding,
      textPainter.height + padding,
    );
    final bgPaint = Paint()..color = Colors.black.withOpacity(0.5);
    canvas.drawRRect(
      RRect.fromRectAndRadius(bgRect, const Radius.circular(12)),
      bgPaint,
    );

    // 🖊️ Yazıyı çiz
    final textOffset = Offset(bgRect.left + padding / 2, bgRect.top + padding / 2);
    textPainter.paint(canvas, textOffset);

    // 📤 Yeni görseli oluştur
    final newImage = await recorder.endRecording().toImage(
      photoImage.width,
      photoImage.height,
    );
    final byteData = await newImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List finalBytes = byteData!.buffer.asUint8List();

    // 💾 Kaydet
    final directory = Directory('/storage/emulated/0/Pictures/MyCameraApp');
    if (!await directory.exists()) await directory.create(recursive: true);

    final filePath = '${directory.path}/IMG_${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File(filePath)..writeAsBytesSync(finalBytes);

    // 🔄 Galeriye bildir
    const platform = MethodChannel('media_scanner_channel');
    await platform.invokeMethod('scanFile', {'path': file.path});

    Get.snackbar("Saved", "Photo saved with info to $filePath");
  } catch (e) {
    Get.snackbar("Error", "Failed: $e");
  }
}
