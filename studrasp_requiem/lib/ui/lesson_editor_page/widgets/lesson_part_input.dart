import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../styles/colors.dart';
import '../../../styles/fonts.dart';

class LessonPartInput extends ConsumerWidget {
  const LessonPartInput({
    Key? key,
    required this.partName,
    required this.controller,
  }) : super(key: key);
  final String partName;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          partName,
          style: textStyles.subtitle,
        ),
        const SizedBox(
          height: 4,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors.backgroundSecondary!,
            border: Border.all(
              width: 1,
              color: colors.separator!,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 12, right: 10),
                  child: TextField(
                    controller: controller,
                    minLines: 1,
                    style: textStyles.label!
                        .copyWith(color: colors.accentSecondary),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 42,
                height: 42,
                child: IconButton(
                  onPressed: () {
                    // переход назад
                  },
                  icon: SvgPicture.asset(
                    'assets/images/command.svg',
                    color: colors.accentPrimary,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
