import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/time_table/time_table_model.dart';

class TimeTableCard extends StatelessWidget {
  const TimeTableCard({Key? key, required this.timeTable, required this.button})
      : super(key: key);

  final TimeTable timeTable;
  final Widget button;

  //временно тут
  String getDate() {
    DateFormat dateFormat = DateFormat('d MMM');
    return dateFormat.format(timeTable.lastUpdateDate);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 8),
      child: Row(
        children: [
          Column(
            children: [
              Text(timeTable.name),
              Text(
                '${timeTable.lastEditor.name} • ${getDate()}',
                style: null,
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
