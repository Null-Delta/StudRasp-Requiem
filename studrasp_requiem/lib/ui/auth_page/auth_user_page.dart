import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/user_auth.dart';
import '../user_profile_page/user_profile_page.dart';
import 'auth_page.dart';

class AuthUserPage extends ConsumerWidget {
  const AuthUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(userAuth.notifier).checkVerify();
    return ref.watch(userAuth).isRegistered
        ? const UserProfilePage()
        : const AuthPage();
  }
}
