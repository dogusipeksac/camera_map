import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // 🖼️ Uygulama ikonu (Lottie yerine)
            Image.asset(
              'assets/icon/app_icon.png',
              width: 120,
              height: 120,
            ),
        
            const SizedBox(height: 16),
        
            const Text(
              'MyMapCamera',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
        
            const Spacer(),
        
            // 📦 Versiyon bilgisi
            FutureBuilder<String>(
              future: controller.getAppVersion(),
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    snapshot.data != null ? "v${snapshot.data}" : "",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
