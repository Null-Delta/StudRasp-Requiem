import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer.freezed.dart';

@freezed
class Developer with _$Developer {
  factory Developer({
    required Image image,
    required String name,
    required String email,
    required String description,
    required String gitURL,
  }) = _Developer;
}
