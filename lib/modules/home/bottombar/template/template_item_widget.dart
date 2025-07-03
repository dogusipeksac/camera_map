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
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Başlık + Seçim + Düzenleme
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
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Bilgi kutusu (görselsiz)
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showCheckIn)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'check_in'.tr,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  const SizedBox(height: 8),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Yerine sade ikon
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.place, color: Colors.white),
                      ),

                      const SizedBox(width: 12),

                      // Bilgi metinleri
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'İstanbul, Türkiye',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Hamidiye, Selman Sokağı No:48, 34925 Sancaktepe',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Lat 40.954 Long 29.289 | 02/07/2025 09:48 AM GMT +03:00',
                              style: TextStyle(color: Colors.white54, fontSize: 11),
                            ),
                            SizedBox(height: 6),

                            // Hava durumu vs.
                            Wrap(
                              spacing: 12,
                              runSpacing: 6,
                              children: [
                                _InfoItem(icon: Icons.thermostat, label: '24.0 °C'),
                                _InfoItem(icon: Icons.air, label: '17.7 km/h'),
                              ],
                            ),
                          ],
                        ),
                      ),
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.lightBlue),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
