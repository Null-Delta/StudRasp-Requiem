import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/assets.gen.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';

class AppTextField extends ConsumerStatefulWidget {
  const AppTextField({
    Key? key,
    required this.controller,
    this.label,
    this.hint,
    this.onTap,
    this.obscureText = false,
    this.showError = true,
    this.validator,
    this.errorText,
    this.onChangeValidation,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final String? hint;

  final VoidCallback? onTap;
  final bool obscureText;

  final bool showError;
  final RegExp? validator;
  final String? errorText;
  final Function(bool)? onChangeValidation;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends ConsumerState<AppTextField> {
  late final obscureText = StateProvider<bool>((ref) {
    return widget.obscureText;
  });

  late final validateProvider = Provider<String?>((ref) {
    if (widget.validator == null) return null;
    if (widget.validator!.hasMatch(widget.controller.text)) return null;

    return widget.errorText;
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;
    final colors = Theme.of(context).extension<AppColors>()!;
    final obscure = ref.watch(obscureText);

    ref.refresh(validateProvider);

    ref.listen<String?>(
      validateProvider,
      (last, next) {
        widget.onChangeValidation?.call(next == null);
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.label!,
              style: textStyles.label,
            ),
          ),
        TextField(
          controller: widget.controller,
          obscureText: obscure,
          onChanged: widget.validator != null
              ? (value) {
                  ref.refresh(validateProvider);
                }
              : null,
          decoration: InputDecoration(
            hintText: widget.hint,
            errorText: widget.showError ? ref.watch(validateProvider) : null,
            errorMaxLines: 3,
            isDense: true,
            contentPadding: const EdgeInsets.all(12),
            suffixIconConstraints: const BoxConstraints(),
            suffixIcon: SizedBox(
              height: 40,
              child: widget.obscureText
                  ? Material(
                      color: Colors.transparent,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        splashRadius: 22,
                        onPressed: () {
                          ref
                              .read(obscureText.notifier)
                              .update((state) => !state);
                        },
                        icon: Icon(
                          obscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: colors.accentPrimary,
                        ),
                      ),
                    )
                  : widget.onTap != null
                      ? Material(
                          color: Colors.transparent,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            splashRadius: 22,
                            onPressed: widget.onTap,
                            icon: Assets.images.command.svg(
                              color: colors.accentPrimary,
                            ),
                          ),
                        )
                      : null,
            ),
          ),
        )
      ],
    );
  }
}
