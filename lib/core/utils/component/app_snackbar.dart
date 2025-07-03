import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static void success(String message, {String title = "Success"}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green.shade600,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }

  static void error(String message, {String title = "Error"}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red.shade600,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error, color: Colors.white),
    );
  }

  static void info(String message, {String title = "Info"}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue.shade600,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.info, color: Colors.white),
    );
  }
}
