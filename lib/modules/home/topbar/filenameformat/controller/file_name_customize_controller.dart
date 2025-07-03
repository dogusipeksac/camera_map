import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/time_zone_helper.dart';

enum FileNamePartType {
  dateTime,
  numbering,
  customName,
  city,
  latLong,
  plusCode,
  timeZone,
}

class FileNamePart {
  FileNamePart(this.type, {this.enabled = false});

  final FileNamePartType type;
  bool enabled;

  Map<String, dynamic> toJson() => {'type': type.name, 'enabled': enabled};

  factory FileNamePart.fromJson(Map<String, dynamic> json) {
    return FileNamePart(
      FileNamePartType.values.firstWhere((e) => e.name == json['type']),
      enabled: json['enabled'],
    );
  }
}

class FileNameCustomizeController extends GetxController {
  static const _prefsKey = 'file_name_parts';

  var parts = <FileNamePart>[].obs;
  var fileName = ''.obs;
  var customName = 'ByMyMapCamera'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadFromPrefs();
  }

  void toggle(FileNamePart part) {
    if (part.type == FileNamePartType.dateTime)
      return; // ❌ Daima aktif, toggle edilemez
    part.enabled = !part.enabled;
    parts.refresh();
    _saveToPrefs();
    generateFileName();
  }

  void reorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final item = parts.removeAt(oldIndex);
    parts.insert(newIndex, item);
    _saveToPrefs();
    generateFileName();
  }

  void setCustomName(String value) {
    customName.value = value;
    generateFileName();
  }

  void generateFileName() {
    final now = DateTime.now();
    final dateTimeString = DateFormat(
      "yyyyMMdd_hhmssa",
    ).format(now).toUpperCase();
    final timeZone = TimeZoneHelper.getCurrentTimeZone();

    final enabledParts = parts
        .where((e) => e.enabled || e.type == FileNamePartType.dateTime)
        .map((e) {
          switch (e.type) {
            case FileNamePartType.dateTime:
              return dateTimeString;
            case FileNamePartType.numbering:
              return "001";
            case FileNamePartType.customName:
              return customName.value;
            case FileNamePartType.city:
              return "Adana";
            case FileNamePartType.latLong:
              return "41.0082_28.9784";
            case FileNamePartType.plusCode:
              return "8G2P+XH";
            case FileNamePartType.timeZone:
              return timeZone;
          }
        })
        .toList();

    fileName.value = "IMG_${enabledParts.join("_")}.jpg";
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = parts.map((e) => e.toJson()).toList();
    await prefs.setString(_prefsKey, jsonEncode(jsonList));
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_prefsKey);

    if (jsonString != null) {
      final List decoded = jsonDecode(jsonString);
      final loadedParts = decoded
          .map((e) => FileNamePart.fromJson(e as Map<String, dynamic>))
          .toList();

      // 🛡️ Ensure dateTime is always enabled and first
      loadedParts.removeWhere((e) => e.type == FileNamePartType.dateTime);
      loadedParts.insert(
        0,
        FileNamePart(FileNamePartType.dateTime, enabled: true),
      );

      parts.assignAll(loadedParts);
    } else {
      parts.addAll([
        FileNamePart(FileNamePartType.dateTime, enabled: true),
        FileNamePart(FileNamePartType.numbering),
        FileNamePart(FileNamePartType.customName, enabled: true),
        FileNamePart(FileNamePartType.city),
        FileNamePart(FileNamePartType.latLong),
        FileNamePart(FileNamePartType.plusCode),
        FileNamePart(FileNamePartType.timeZone),
      ]);
    }

    generateFileName();
  }

  String getPartLabel(FileNamePartType type) {
    switch (type) {
      case FileNamePartType.dateTime:
        return 'fileName.dateTime'.tr;
      case FileNamePartType.numbering:
        return 'fileName.numbering'.tr;
      case FileNamePartType.customName:
        return 'fileName.customName'.tr;
      case FileNamePartType.city:
        return 'fileName.city'.tr;
      case FileNamePartType.latLong:
        return 'fileName.latLong'.tr;
      case FileNamePartType.plusCode:
        return 'fileName.plusCode'.tr;
      case FileNamePartType.timeZone:
        return 'fileName.timeZone'.tr;
    }
  }
}
