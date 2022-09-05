import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/assets.gen.dart';
import '../../providers/user_auth.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../widgets/app_text_field.dart';

part '../auth_page/widgets/auth_page_text_fields.dart';

final _activeValidatorProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final _isAuthProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

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

class _AuthPageState extends ConsumerState<AuthPage>
    with SingleTickerProviderStateMixin {
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();

  final validationController = ValidationController({
    'name': false,
    'email': false,
    'password': false,
  });

  late final animationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  void auth() async {
    ref.read(_activeValidatorProvider.notifier).state = true;
    final isValidate = validationController.state['email']! &&
        validationController.state['password']!;

    if (isValidate) {
      print(
        await ref
            .read(userAuth.notifier)
            .auth(email: email.text, password: password.text),
      );
    }
  }

  void reg() async {
    ref.read(_activeValidatorProvider.notifier).state = true;

    if (validationController.isValidate()) {
      print(
        await ref.read(userAuth.notifier).reg(
              name: name.text,
              email: email.text,
              password: password.text,
            ),
      );
    }
  }

  void switchAuthMode() {
    if (!animationController.isAnimating) {
      if (animationController.isCompleted) {
        animationController.reverse();
      } else if (animationController.isDismissed) {
        animationController.forward();
      }
      ref.read(_activeValidatorProvider.notifier).state = false;
      ref.read(_isAuthProvider.notifier).update((state) => !state);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    ref.listen(userAuth, (previous, next) {
      log(next.toString());
    });

    final isAuth = ref.watch(_isAuthProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.2),
                  end: const Offset(0, 0),
                ).animate(
                  CurvedAnimation(
                    parent: animationController,
                    curve: Curves.easeInOutBack,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 36),
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
                  ],
                ),
              ),
              const SizedBox(height: 32),
              AuthPageTextFields(
                animationController: animationController,
                validationController: validationController,
                name: name,
                email: email,
                password: password,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: isAuth ? auth : reg,
                style: ElevatedButton.styleFrom(
                  textStyle: textStyles.subtitle,
                  minimumSize: const Size(double.infinity, 42),
                ),
                child: Text(isAuth ? 'Войти' : 'Зарегистрироваться'),
              ),
              const SizedBox(height: 6),
              Text(
                'Или',
                style: textStyles.smallLabel,
              ),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: switchAuthMode,
                style: ElevatedButton.styleFrom(
                  textStyle: textStyles.subtitle,
                  backgroundColor: colors.backgroundPrimary,
                  foregroundColor: colors.accentPrimary,
                  side: BorderSide(
                    color: colors.separator!,
                  ),
                  minimumSize: const Size(double.infinity, 42),
                ),
                child: Text(isAuth ? 'Зарегистрироваться' : 'Войти'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
