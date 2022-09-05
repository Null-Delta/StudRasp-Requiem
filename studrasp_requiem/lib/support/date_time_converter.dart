extension DurationConverter on Duration {
  String get stringTime {
    return "${inHours < 10 ? "0" : ""}$inHours:${inMinutes % 60 < 10 ? "0" : ""}${inMinutes % 60}";
  }
}

extension DateTimeConverter on DateTime {
  DateTime startOfDay() {
    var start = Duration(milliseconds: millisecondsSinceEpoch).inMilliseconds;

    start -= hour * 3600 * 1000;
    start -= minute * 60 * 1000;
    start -= second * 1000;
    start -= millisecond;

    return DateTime.fromMillisecondsSinceEpoch(start);
  }

  Duration timeOfDay() {
    return Duration(milliseconds: millisecondsSinceEpoch - startOfDay().millisecondsSinceEpoch);
  }
}
