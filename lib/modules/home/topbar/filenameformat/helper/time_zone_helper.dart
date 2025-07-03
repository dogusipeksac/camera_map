class TimeZoneHelper {
  static String getCurrentTimeZone() {
    final now = DateTime.now();
    final offset = now.timeZoneOffset;

    final hours = offset.inHours;
    final minutes = offset.inMinutes.remainder(60);
    final sign = hours >= 0 ? "+" : "-";

    return "GMT$sign${hours.abs().toString().padLeft(2, '0')}"
        "${minutes != 0 ? ":${minutes.abs().toString().padLeft(2, '0')}" : ""}";
  }
}
