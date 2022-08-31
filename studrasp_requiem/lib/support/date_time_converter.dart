extension DurationConverter on Duration {
  String get stringTime {
    return "${inHours < 10 ? "0" : ""}$inHours:${inMinutes % 60 < 10 ? "0" : ""}${inMinutes % 60}";
  }
}
