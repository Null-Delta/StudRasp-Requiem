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

  final activeValidator = StateProvider<bool>((ref) {
    return false;
  });

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
              Consumer(
                builder: (_, ref, __) {
                  final active = ref.watch(activeValidator);
                  return Column(
                    children: [
                      AppTextField(
                        controller: name,
                        hint: 'Имя',
                        activeValidator: active,
                        validator: RegExp(r'^[а-яА-ЯёЁa-zA-Z0-9 ]{2,}$'),
                        errorText:
                            'Имя должно быть длинее 2-х символов и собержать только буквы и цифры.',
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        controller: email,
                        hint: 'Email',
                        activeValidator: active,
                        validator: RegExp(
                          r'^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$',
                        ),
                        errorText: 'Некорректный Email.',
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        controller: password,
                        hint: 'Пароль',
                        obscureText: true,
                        activeValidator: active,
                        validator: RegExp(
                          r'^[0-9a-zA-Z!@#$%^&*]{5,}$',
                        ),
                        errorText: 'Пароль должен быть длиннее 4-х символов.',
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  ref.read(activeValidator.notifier).state = true;
                  // ref
                  //     .read(userAuth.notifier)
                  //     .auth(email: email.text, password: password.text);
                },
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
                onPressed: () async {
                  ref.read(activeValidator.notifier).state = true;
                  // ref.read(userAuth.notifier).reg(
                  //       name: name.text,
                  //       email: email.text,
                  //       password: password.text,
                  //     );
                },
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
