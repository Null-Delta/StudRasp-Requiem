import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String name,
    required String email,
    @Default(false) bool isVerified,
    @Default(false) bool isRegistered,
    String? photoURL,
  }) = _User;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  factory AppUser.empty() {
    return const AppUser(
      id: '1',
      name: '',
      email: '',
    );
  }
}
