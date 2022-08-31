import 'package:flutter/material.dart';

import '../../models/timetable/timetable_model.dart';
import '../../models/timetable_config/timetable_config_model.dart';
import '../../models/user/user_model.dart';
import '../../styles/build_context_extension.dart';
import '../../styles/button_style.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import 'widgets/time_table_card.dart';

enum TimeTableListType { saved, owned }

class TimeTableListPage extends StatefulWidget {
  const TimeTableListPage({Key? key}) : super(key: key);

  @override
  State<TimeTableListPage> createState() => _TimeTableListPageState();
}

class _TimeTableListPageState extends State<TimeTableListPage> {
  TimeTableListType listType = TimeTableListType.saved;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    ;
    final textStyles = context.textStyles;

    final List<Timetable> savedTables = List<Timetable>.generate(
      20,
      (index) => Timetable(
        id: "0",
        name: "Шарарам 36/2",
        days: [],
        owner: const User(id: "0", name: "JakeApps", avatarUrl: ""),
        editors: [],
        lastEditor: const User(id: "0", name: "JakeApps", avatarUrl: ""),
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        config: TimetableConfig.empty(),
      ),
    );

    final List<Timetable> myTables = List<Timetable>.generate(
      6,
      (index) => Timetable(
        id: "0",
        name: "Не шарарам 36/1",
        days: [],
        owner: const User(id: "0", name: "JakeApps", avatarUrl: ""),
        editors: [],
        lastEditor: const User(id: "0", name: "JakeApps", avatarUrl: ""),
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        config: TimetableConfig.empty(),
      ),
    );

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ElevatedButton(
                    style: plainButton(colors, size: const Size(42, 42)),
                    onPressed: () {},
                    child: const Icon(Icons.arrow_back_sharp),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Список\nрасписаний",
                style: textStyles.largeTitle!,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: tabButton(
                          colors, listType == TimeTableListType.saved),
                      onPressed: () {
                        setState(() {
                          listType = TimeTableListType.saved;
                        });
                      },
                      child: Text(
                        "Сохраненные",
                        style: textStyles.smallLabel!.copyWith(
                          color: listType == TimeTableListType.saved
                              ? colors.backgroundPrimary
                              : colors.accentPrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: tabButton(
                          colors, listType == TimeTableListType.owned),
                      onPressed: () {
                        setState(() {
                          listType = TimeTableListType.owned;
                        });
                      },
                      child: Text(
                        "Мои",
                        style: textStyles.smallLabel!.copyWith(
                          color: listType == TimeTableListType.saved
                              ? colors.accentPrimary
                              : colors.backgroundPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: colors.separator,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return TimeTableCard(
                    timeTable: listType == TimeTableListType.saved
                        ? savedTables[index]
                        : myTables[index],
                    button: Icon(
                      Icons.abc,
                      color: colors.accentPrimary!,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    thickness: 1,
                    color: colors.separator,
                  );
                },
                itemCount: listType == TimeTableListType.saved
                    ? savedTables.length
                    : myTables.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
