import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/assets.gen.dart';
import '../../providers/user_auth.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../widgets/app_text_field.dart';

class ValidationController {
  Map<String, bool> state;

  ValidationController(this.state);

  void setValidation(String name, bool validate) {
    state = state..[name] = validate;
  }

  bool isValidate() {
    return state.values.every((element) => element);
  }
}

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

  final validationController = ValidationController({
    'name': false,
    'email': false,
    'password': false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    ref.listen(userAuth, (previous, next) {
      log(next.toString());
    });

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
                        showError: active,
                        validator: RegExp(r'^[а-яА-ЯёЁa-zA-Z0-9 ]{2,}$'),
                        onChangeValidation: (val) {
                          validationController.setValidation('name', val);
                        },
                        errorText:
                            'Имя должно содержать хотя-бы 2 символа и состоять только из букв и цифр.',
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        controller: email,
                        hint: 'Email',
                        showError: active,
                        validator: RegExp(
                          r'^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$',
                        ),
                        onChangeValidation: (val) {
                          validationController.setValidation('email', val);
                        },
                        errorText: 'Некорректный Email.',
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        controller: password,
                        hint: 'Пароль',
                        obscureText: true,
                        showError: active,
                        validator: RegExp(
                          r'(?=.*[0-9a-zA-Z]).{6,}',
                        ),
                        onChangeValidation: (val) {
                          validationController.setValidation('password', val);
                        },
                        errorText:
                            'Пароль должнен содержать хотя-бы 6 символов и не иметь кириллических букв.',
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  ref.read(activeValidator.notifier).state = true;
                  if (validationController.isValidate()) {
                    print(
                      await ref
                          .read(userAuth.notifier)
                          .auth(email: email.text, password: password.text),
                    );
                  }
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
                  if (validationController.isValidate()) {
                    print(
                      await ref.read(userAuth.notifier).reg(
                            name: name.text,
                            email: email.text,
                            password: password.text,
                          ),
                    );
                  }
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
