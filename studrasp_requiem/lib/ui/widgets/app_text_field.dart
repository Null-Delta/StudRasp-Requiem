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
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final String? hint;

  final VoidCallback? onTap;

  final bool isPassword;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends ConsumerState<AppTextField> {
  late final obscureText = StateProvider<bool>((ref) {
    return widget.isPassword;
  });
  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;
    final colors = Theme.of(context).extension<AppColors>()!;

    final obscure = ref.watch(obscureText);
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
        SizedBox(
          height: 42,
          child: TextField(
            controller: widget.controller,
            obscureText: obscure,
            decoration: InputDecoration(
              hintText: widget.hint,
              suffixIcon: widget.isPassword
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
