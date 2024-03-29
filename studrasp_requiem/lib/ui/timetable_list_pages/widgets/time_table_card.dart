import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/timetable/timetable_model.dart';
import '../../../styles/build_context_extension.dart';

class TimetableCard extends StatelessWidget {
  final Timetable timeTable;
  final Widget button;
  final bool showOwner;
  final Function() onTap;

  const TimetableCard({
    Key? key,
    required this.timeTable,
    required this.button,
    required this.onTap,
    this.showOwner = true,
  }) : super(key: key);

  //временно тут
  String getDate() {
    DateFormat dateFormat = DateFormat('d MMM');
    return dateFormat.format(timeTable.lastUpdateDate);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: ColoredBox(
        color: colors.backgroundPrimary!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    timeTable.name,
                    style: textStyles.subtitle,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Обновлено ${getDate()}',
                    style: textStyles.smallLabel!.copyWith(color: colors.disable),
                  ),
                  if (showOwner)
                    Text(
                      'Владелец ${timeTable.owner.name}',
                      style: textStyles.smallLabel!.copyWith(color: colors.disable),
                    ),
                ],
              ),
              const Spacer(),
              Container(
                color: colors.backgroundPrimary,
                width: 42,
                height: 42,
                child: Center(
                  child: button,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
