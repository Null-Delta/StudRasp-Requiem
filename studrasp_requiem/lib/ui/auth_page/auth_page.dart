import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/assets.gen.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
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
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 48),
              SizedBox(
                height: 128,
                width: 128,
                child: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Assets.images.studRaspLightIcon.image()
                    : Assets.images.studRaspDarkIcon.image(),
              ),
              Text(
                'StudRasp',
                style: textStyles.title!.copyWith(
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 32),
              AppTextField(
                controller: name,
                hint: 'Имя',
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: email,
                hint: 'Email',
              ),
              const SizedBox(height: 12),
              AppTextField(
                controller: password,
                hint: 'Пароль',
                isPassword: true,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  textStyle: textStyles.subtitle,
                  minimumSize: const Size(double.infinity, 42),
                ),
                child: const Text('Войти'),
              ),
              const SizedBox(height: 6),
              Text(
                'Или',
                style: textStyles.smallLabel,
              ),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  textStyle: textStyles.subtitle,
                  primary: colors.backgroundPrimary,
                  onPrimary: colors.accentPrimary,
                  side: BorderSide(
                    color: colors.separator!,
                  ),
                  minimumSize: const Size(double.infinity, 42),
                ),
                child: const Text('Зарегистрироваться'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
