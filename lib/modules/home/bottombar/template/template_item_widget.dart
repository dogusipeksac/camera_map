import 'package:flutter/material.dart';
import 'package:camera_map/modules/home/bottombar/template/enum/template_type.dart';
import 'package:get/get.dart';

class TemplateItem extends StatelessWidget {
  final String title;
  final TemplateType type;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showCheckIn;

  const TemplateItem({
    super.key,
    required this.title,
    required this.type,
    required this.isSelected,
    required this.onTap,
    this.showCheckIn = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔘 Başlık ve Seçim Alanı
            Row(
              children: [
                Icon(
                  isSelected ? Icons.check_circle : Icons.radio_button_off,
                  color: isSelected ? Colors.green : Colors.grey,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // 🗺️ Bilgi Kartı
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showCheckIn)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'check_in'.tr,
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),

                  const SizedBox(height: 10),

                  // 🌍 Harita ve metin bilgileri
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 📍 Harita Görseli (örnek)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/location.png', // 📌 senin görselinle değiştir
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),

                      // 📝 Konum Bilgileri
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'İstanbul, Türkiye',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Hamidiye, Selman Sokağı No:48, 34925 Sancaktepe/İstanbul',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Lat 40.954 | Long 29.289 | 02/07/2025 09:48 AM GMT +03:00',
                              style: TextStyle(color: Colors.white54, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // 🌦️ İstatistikler
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _InfoItem(icon: Icons.thermostat, label: '24.0 °C'),
                      _InfoItem(icon: Icons.air, label: '17.7 km/h'),
                      _InfoItem(icon: Icons.wifi, label: '1000.2 hPa'),
                      _InfoItem(icon: Icons.water_drop_outlined, label: '43 %'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.lightBlueAccent),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
