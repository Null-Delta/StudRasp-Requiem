import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../lesson_editor_page/widgets/lesson_part_input.dart';

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
            LessonPartInput(
              partName: 'Email',
              controller: email,
            ),
            const SizedBox(height: 12),
            LessonPartInput(
              partName: 'Имя',
              controller: email,
            ),
            const SizedBox(height: 12),
            LessonPartInput(
              partName: 'Пароль',
              controller: email,
            ),
          ],
        ),
      ),
    );
  }
}
