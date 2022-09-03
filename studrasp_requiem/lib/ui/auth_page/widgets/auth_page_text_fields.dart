part of '../auth_page.dart';

class AuthPageTextFields extends ConsumerStatefulWidget {
  const AuthPageTextFields({
    Key? key,
    required this.animationController,
    required this.validationController,
    required this.name,
    required this.email,
    required this.password,
  }) : super(key: key);

  final AnimationController animationController;

  final ValidationController validationController;

  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AuthPageTextFieldsState();
}

class _AuthPageTextFieldsState extends ConsumerState<AuthPageTextFields> {
  @override
  Widget build(BuildContext context) {
    final active = ref.watch(activeValidatorProvider);
    return Column(
      children: [
        FadeTransition(
          opacity: CurvedAnimation(
            parent: widget.animationController,
            curve: Curves.easeInOutBack,
          ),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -0.5),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: widget.animationController,
                curve: Curves.easeInOutBack,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: AppTextField(
                controller: widget.name,
                hint: 'Имя',
                showError: active && !ref.watch(isAuthProvider),
                validator: RegExp(r'^[а-яА-ЯёЁa-zA-Z0-9 ]{2,}$'),
                onChangeValidation: (val) {
                  widget.validationController.setValidation(
                    'name',
                    val,
                  );
                },
                errorText:
                    'Имя должно содержать хотя-бы 2 символа и состоять только из букв и цифр.',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: AppTextField(
            controller: widget.email,
            hint: 'Email',
            showError: active,
            validator: RegExp(
              r'^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$',
            ),
            onChangeValidation: (val) {
              widget.validationController.setValidation('email', val);
            },
            errorText: 'Некорректный Email.',
          ),
        ),
        AppTextField(
          controller: widget.password,
          hint: 'Пароль',
          obscureText: true,
          showError: active,
          validator: RegExp(
            r'(?=.*[0-9a-zA-Z]).{6,}',
          ),
          onChangeValidation: (val) {
            widget.validationController.setValidation('password', val);
          },
          errorText:
              'Пароль должнен содержать хотя-бы 6 символов и не иметь кириллических букв.',
        ),
      ],
    );
  }
}
