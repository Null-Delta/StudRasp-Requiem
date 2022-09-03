import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user/user_model.dart';

final userAuth = StateNotifierProvider<UserAuthNotifier, AppUser>((ref) {
  return UserAuthNotifier(
    AppUser.empty(),
  );
});

class UserAuthNotifier extends StateNotifier<AppUser> {
  UserAuthNotifier(super.state) {
    _init();
  }

  Future<void> _init() async {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        state = AppUser(
          id: user.uid,
          name: user.displayName ?? '',
          email: user.email!,
          isVerified: user.emailVerified,
          photoURL: user.photoURL,
        );
      }
    });
  }

  Future<String?> auth({
    required String email,
    required String password,
  }) async {
    try {
      final res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (res.user != null) {
        final user = res.user!;
        state = AppUser(
          id: user.uid,
          name: user.displayName ?? '',
          email: user.email!,
          isVerified: user.emailVerified,
          photoURL: user.photoURL,
        );
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return null;
  }

  Future<String?> reg({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final res = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (res.user != null) {
        final user = res.user!;
        await Future.wait([
          user.sendEmailVerification(),
          user.updateDisplayName(name),
        ]);

        state = AppUser(
          id: user.uid,
          name: user.displayName ?? name,
          email: user.email!,
          isVerified: user.emailVerified,
          photoURL: user.photoURL,
        );
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      return null;
    }
    return null;
  }
}
