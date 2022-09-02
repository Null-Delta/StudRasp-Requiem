import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/providers.dart';
import '../../styles/build_context_extension.dart';
import '../../styles/colors.dart';
import '../../styles/widget_styles.dart';

enum DayButtonStyle { defalut, highlighted, selected }

class DayButton extends ConsumerStatefulWidget {
  final Duration diration;

  const DayButton({
    Key? key,
    required this.diration,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DayButtonState();
}

class _DayButtonState extends ConsumerState<DayButton> {
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

  late DayButtonStyle style;

  @override
  Widget build(BuildContext context) {
    style = ref.watch(dayButtonStyleProvider(widget.diration));
    final colors = context.colors;

    return SizedBox(
      height: 48,
      child: GestureDetector(
        onTap: () {
          ref.read(selectedDuration.notifier).state = widget.diration;
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
                ref.watch(currentDate).add(widget.diration).day.toString(),
                style: const TextStyle(fontFamily: "Roboto").copyWith(
                  color: dayColor(colors),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                DateFormat('EEE').format(ref.watch(currentDate).add(widget.diration)),
                style: const TextStyle(fontFamily: "Roboto").copyWith(
                  color: colors.disable,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
