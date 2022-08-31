import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/timetable/timetable_model.dart';
import '../../../styles/colors.dart';
import '../../../styles/fonts.dart';

class TimeTableCard extends StatelessWidget {
  final TimeTable timeTable;
  final Widget button;
  final bool showOwner;

  const TimeTableCard({
    Key? key,
    required this.timeTable,
    required this.button,
    this.showOwner = true,
  }) : super(key: key);

  //временно тут
  String getDate() {
    DateFormat dateFormat = DateFormat('d MMM');
    return dateFormat.format(timeTable.lastUpdateDate);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    return Padding(
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
          SizedBox(
            width: 42,
            height: 42,
            child: button,
          ),
        ],
      ),
    );
  }
}
