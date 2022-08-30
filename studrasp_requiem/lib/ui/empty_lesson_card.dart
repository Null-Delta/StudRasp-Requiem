import 'package:flutter/material.dart';

import '../models/time_interval/time_interval_model.dart';
import '../styles/button_style.dart';
import '../styles/colors.dart';
import '../styles/widget_styles.dart';
import 'lesson_card.dart';

class EmptyLessonCard extends StatelessWidget {
  final int index;
  final TimeInterval interval;

  const EmptyLessonCard({
    Key? key,
    required this.index,
    required this.interval,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: BurderRadiusStyles.large,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 6, bottom: 6, right: 6),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              child: Text(
                "1",
                style: TextStyle(fontSize: 12, color: colors.disable!),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "9:30 - 11:00",
              style: TextStyle(fontSize: 12, color: colors.disable),
            ),
            const Spacer(),
            ElevatedButton(
              style: plainButton(colors),
              onPressed: () {},
              child: const Icon(Icons.abc, size: 24),
            )
          ],
        ),
      ),
    );
  }
}
