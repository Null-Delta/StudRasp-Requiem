import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_interval_model.freezed.dart';
part 'time_interval_model.g.dart';

@freezed
class TimeInterval with _$TimeInterval {
  const factory TimeInterval({
    required DateTime from,
    required DateTime to,
  }) = _TimeInterval;

  factory TimeInterval.fromJson(Map<String, dynamic> json) =>
      _$TimeIntervalFromJson(json);
}
