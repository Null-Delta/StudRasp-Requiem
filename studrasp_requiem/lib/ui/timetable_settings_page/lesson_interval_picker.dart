import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';

import '../../models/time_interval/time_interval_model.dart';
import '../../styles/build_context_extension.dart';
import '../../support/date_time_converter.dart';

class LessonIntervalController extends ValueNotifier<TimeInterval> {
  LessonIntervalController(super.state);

  TimeInterval get interval => value;
}

class LessonIntervalPicker extends StatefulWidget {
  final int index;
  final LessonIntervalController controller;

  const LessonIntervalPicker({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  @override
  State<LessonIntervalPicker> createState() => _LessonIntervalPickerState();
}

class _LessonIntervalPickerState extends State<LessonIntervalPicker> {
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
              "${widget.index} пара",
              style: textStyles.label,
            ),
            const Spacer(),
            Text(
              "от",
              style: textStyles.smallLabel!.copyWith(color: colors.disable),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  showPicker(
                    value: TimeOfDay(
                      hour: widget.controller.interval.from.inHours,
                      minute: widget.controller.interval.from.inMinutes % 60,
                    ),
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
                    buttonStyle: ElevatedButton.styleFrom(
                      fixedSize: const Size(80, 36),
                    ),
                    onChange: (time) {
                      setState(() {
                        widget.controller.value =
                            widget.controller.interval.copyWith(
                          from: Duration(
                            hours: time.hour,
                            minutes: time.minute,
                          ),
                        );
                      });
                    },
                    minuteInterval: MinuteInterval.FIVE,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(54, 32),
                backgroundColor: colors.backgroundSecondary,
                side: BorderSide(color: colors.separator!, width: 1),
              ),
              child: Text(
                widget.controller.interval.from.stringTime,
                style: textStyles.smallLabel!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "до",
              style: textStyles.smallLabel!.copyWith(color: colors.disable),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  showPicker(
                    value: TimeOfDay(
                      hour: widget.controller.interval.to.inHours,
                      minute: widget.controller.interval.to.inMinutes % 60,
                    ),
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
                    buttonStyle: ElevatedButton.styleFrom(
                      fixedSize: const Size(80, 36),
                    ),
                    onChange: (time) {
                      setState(() {
                        widget.controller.value =
                            widget.controller.interval.copyWith(
                          to: Duration(
                            hours: time.hour,
                            minutes: time.minute,
                          ),
                        );
                      });
                    },
                    minuteInterval: MinuteInterval.FIVE,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(54, 32),
                backgroundColor: colors.backgroundSecondary,
                side: BorderSide(color: colors.separator!, width: 1),
              ),
              child: Text(
                widget.controller.interval.to.stringTime,
                style: textStyles.smallLabel!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
