import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import 'widgets/lesson_part_input.dart';

class LessonEditorPage extends StatelessWidget {
  const LessonEditorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.backgroundPrimary,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 42,
              height: 42,
              padding: const EdgeInsets.only(left: 16),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  // переход назад
                },
                icon: SvgPicture.asset(
                  'assets/images/circle_chevron_left.svg',
                  color: colors.accentPrimary,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Пара',
              style: textStyles.title,
            ),
            const SizedBox(
              width: 42,
              height: 42,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Divider(
            height: 1,
            color: colors.separator,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                LessonPartInput(
                  partName: 'Название предмета',
                ),
                const SizedBox(
                  height: 12,
                ),
                LessonPartInput(partName: 'Аудитория'),
                const SizedBox(
                  height: 12,
                ),
                LessonPartInput(partName: 'Преподаватель'),
                const SizedBox(
                  height: 12,
                ),
                LessonPartInput(partName: 'Тип'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
