import 'package:flutter/material.dart';

import 'icon_with_text.dart';

class CameraOverlayInfoCard extends StatelessWidget {
  const CameraOverlayInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📍 Title & Address
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left - Address
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("İstanbul, Türkiye",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      SizedBox(height: 2),
                      Text(
                        "Hamidiye, Selman Sokağı No:55, 34925 Sultanbeyli/İstanbul, Türkiye",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      Text("Lat 40.954211  Long 29.289348",
                          style: TextStyle(color: Colors.white70, fontSize: 10)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Right - Time
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text("01/07/2025 12:15",
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    Text("GMT +03:00",
                        style: TextStyle(color: Colors.white54, fontSize: 10)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Divider(color: Colors.white12),
            const SizedBox(height: 6),
            // 🌡️ Weather Info Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                IconWithText(icon: Icons.thermostat, text: "29.6°C"),
                IconWithText(icon: Icons.air, text: "13.0 km/h"),
                IconWithText(icon: Icons.water_drop, text: "40%"),
                IconWithText(icon: Icons.speed, text: "996.1 hPa"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
