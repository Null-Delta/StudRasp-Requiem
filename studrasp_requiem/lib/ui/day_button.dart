import 'package:flutter/material.dart';

import '../styles/build_context_extension.dart';
import '../styles/colors.dart';
import '../styles/widget_styles.dart';

enum DayButtonStyle { defalut, highlighted, selected }

class DayButton extends StatelessWidget {
  final DateTime time;
  final DayButtonStyle style;

  final Function() onSelect;

  const DayButton({
    Key? key,
    required this.time,
    required this.style,
    required this.onSelect,
  }) : super(key: key);

  String get weekDayName {
    switch (time.weekday) {
      case 1:
        return "пн";
      case 2:
        return "вт";
      case 3:
        return "ср";
      case 4:
        return "чт";
      case 5:
        return "пт";
      case 6:
        return "сб";
      default:
        return "вс";
    }
  }

  Color backgroundColor(AppColors colors) {
    switch (style) {
      case DayButtonStyle.defalut:
        return colors.backgroundPrimary!;
      case DayButtonStyle.highlighted:
        return colors.backgroundSecondary!;
      case DayButtonStyle.selected:
        return colors.accentPrimary!;
    }
  }

  Color borderColor(AppColors colors) {
    switch (style) {
      case DayButtonStyle.defalut:
        return colors.separator!;
      case DayButtonStyle.highlighted:
        return colors.separator!;
      case DayButtonStyle.selected:
        return colors.accentPrimary!;
    }
  }

  Color dayColor(AppColors colors) {
    switch (style) {
      case DayButtonStyle.defalut:
        return colors.accentPrimary!;
      case DayButtonStyle.highlighted:
        return colors.accentPrimary!;
      case DayButtonStyle.selected:
        return colors.backgroundPrimary!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    ;

    return GestureDetector(
      onTap: () {
        onSelect();
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BurderRadiusStyles.normal,
          border: Border.all(width: 1, color: borderColor(colors)),
          color: backgroundColor(colors),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time.day.toString(),
              style: const TextStyle(fontFamily: "Roboto").copyWith(
                color: dayColor(colors),
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              weekDayName,
              style: const TextStyle(fontFamily: "Roboto").copyWith(
                color: colors.disable,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
