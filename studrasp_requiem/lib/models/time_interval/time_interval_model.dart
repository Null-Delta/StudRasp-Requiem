import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_interval_model.freezed.dart';
part 'time_interval_model.g.dart';

@freezed
class TimeInterval with _$TimeInterval {
  const factory TimeInterval({
    required Duration from,
    required Duration to,
  }) = _TimeInterval;

  const TimeInterval._();

  factory TimeInterval.fromJson(Map<String, dynamic> json) =>
      _$TimeIntervalFromJson(json);

  bool constains(DateTime time) {
    return (time.second + time.minute * 60 + time.hour * 3600 >=
            from.inSeconds) &&
        (time.second + time.minute * 60 + time.hour * 3600 < to.inSeconds);
  }
}
