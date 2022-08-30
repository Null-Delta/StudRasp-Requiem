extension DateTimeConverter on DateTime {
  String get stringTime {
    return "${hour < 10 ? "0" : ""}$hour:${minute < 10 ? "0" : ""}$minute";
  }
}
