import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../styles/colors.dart';
import '../../../styles/fonts.dart';

class LessonPartInput extends StatelessWidget {
  const LessonPartInput({Key? key, required this.partName}) : super(key: key);
  final String partName;

  @override
  Widget build(BuildContext context) {
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
              Container(
                padding: const EdgeInsets.only(left: 12, right: 10),
                child: Text(
                  'Название',
                  style:
                      textStyles.label!.copyWith(color: colors.accentSecondary),
                  maxLines: null,
                ),
              ),
              const Spacer(),
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
