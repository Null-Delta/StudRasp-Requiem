import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class AppUser with _$User {
  const factory AppUser({
    required String id,
    required String name,
    required String email,
    required bool isVerified,
    String? photoURL,
  }) = _User;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory AppUser.empty() {
    return const AppUser(
      id: '',
      name: '',
      email: '',
      isVerified: false,
    );
  }
}
