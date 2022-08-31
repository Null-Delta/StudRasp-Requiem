import 'package:flutter/material.dart';

import '../../models/time_interval/time_interval_model.dart';
import '../../styles/build_context_extension.dart';
import '../../styles/button_style.dart';
import '../../support/date_time_converter.dart';

class LessonIntervalPicker extends StatelessWidget {
  final int index;
  final TimeInterval interval;

  const LessonIntervalPicker({
    Key? key,
    required this.index,
    required this.interval,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 56,
        child: Row(
          children: [
            Text(
              "$index пара",
              style: textStyles.label,
            ),
            const Spacer(),
            Text("от", style: textStyles.smallLabel!.copyWith(color: colors.disable)),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialEntryMode: TimePickerEntryMode.dial,
                  initialTime: const TimeOfDay(
                    hour: 0,
                    minute: 0,
                  ),
                ).then((value) {
                  // TODO: set new time
                });
              },
              style: plainButton(colors, size: const Size(54, 32)).copyWith(
                side: MaterialStateProperty.all(BorderSide(color: colors.separator!, width: 1)),
                backgroundColor: MaterialStateProperty.all(colors.backgroundSecondary),
              ),
              child: Text(
                interval.from.stringTime,
                style: textStyles.smallLabel,
              ),
            ),
            const SizedBox(width: 8),
            Text("до", style: textStyles.smallLabel!.copyWith(color: colors.disable)),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: const TimeOfDay(hour: 0, minute: 0),
                  initialEntryMode: TimePickerEntryMode.dial,
                ).then((value) {
                  // TODO: set new time
                });
              },
              style: plainButton(colors, size: const Size(54, 32)).copyWith(
                side: MaterialStateProperty.all(BorderSide(color: colors.separator!, width: 1)),
                backgroundColor: MaterialStateProperty.all(colors.backgroundSecondary),
              ),
              child: Text(
                interval.to.stringTime,
                style: textStyles.smallLabel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
