import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
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
                Navigator.of(context).push(
                  showPicker(
                    value: TimeOfDay(hour: interval.from.inHours, minute: interval.from.inMinutes % 60),
                    hourLabel: "",
                    minuteLabel: "",
                    ltrMode: true,
                    accentColor: colors.accentPrimary,
                    unselectedColor: colors.disable,
                    blurredBackground: false,
                    displayHeader: true,
                    elevation: 128,
                    borderRadius: 12,
                    iosStylePicker: false,
                    is24HrFormat: true,
                    context: context,
                    okStyle: textStyles.subtitle!,
                    cancelStyle: textStyles.subtitle!,
                    buttonStyle: plainButton(colors, size: const Size(80, 36)),
                    onChange: (time) {},
                    minuteInterval: MinuteInterval.FIVE,
                  ),
                );
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
                Navigator.of(context).push(
                  showPicker(
                    value: TimeOfDay(hour: interval.to.inHours, minute: interval.to.inMinutes % 60),
                    hourLabel: "",
                    minuteLabel: "",
                    ltrMode: true,
                    accentColor: colors.accentPrimary,
                    unselectedColor: colors.disable,
                    blurredBackground: false,
                    displayHeader: true,
                    elevation: 128,
                    borderRadius: 12,
                    iosStylePicker: false,
                    is24HrFormat: true,
                    context: context,
                    okStyle: textStyles.subtitle!,
                    cancelStyle: textStyles.subtitle!,
                    buttonStyle: plainButton(colors, size: const Size(80, 36)),
                    onChange: (time) {},
                    minuteInterval: MinuteInterval.FIVE,
                  ),
                );
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
