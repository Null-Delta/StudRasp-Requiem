import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/app_text_field.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AppTextField(
              controller: email,
              label: 'Email',
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: name,
              label: 'Имя',
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: password,
              label: 'Пароль',
              isPassword: true,
            ),
          ],
        ),
      ),
    );
  }
}
