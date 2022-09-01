import 'dart:math';

import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../models/timetable/timetable_model.dart';
import '../../models/timetable_config/timetable_config_model.dart';
import '../../models/user/user_model.dart';
import '../../styles/build_context_extension.dart';
import '../../styles/text_field_style.dart';
import '../timetable_list_pages/widgets/time_table_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchFieldFocus = FocusNode();

  List<Timetable> findedTables = List<Timetable>.generate(
    20,
    (index) => Timetable(
      id: "0",
      name: "${Random().nextInt(100)}",
      days: [],
      owner: const User(id: "0", name: "JakeApps", avatarUrl: ""),
      editors: [],
      lastEditor: const User(id: "0", name: "JakeApps", avatarUrl: ""),
      creationDate: DateTime.now(),
      lastUpdateDate: DateTime.now(),
      config: TimetableConfig.empty(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            onPressed: () {},
            icon: Assets.images.circleChevronLeft.svg(),
            splashRadius: 24,
          ),
        ),
        title: Text(
          "Поиск",
          style: textStyles.title,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 42,
              child: TextField(
                focusNode: searchFieldFocus,
                onEditingComplete: () {
                  final tablesCount = Random().nextInt(10);
                  setState(
                    () {
                      findedTables = List<Timetable>.generate(
                        tablesCount,
                        (index) => Timetable(
                          id: "0",
                          name: "${Random().nextInt(100)}",
                          days: [],
                          owner: const User(id: "0", name: "JakeApps", avatarUrl: ""),
                          editors: [],
                          lastEditor: const User(id: "0", name: "JakeApps", avatarUrl: ""),
                          creationDate: DateTime.now(),
                          lastUpdateDate: DateTime.now(),
                          config: TimetableConfig.empty(),
                        ),
                      );
                    },
                  );
                  searchFieldFocus.unfocus();
                },
                style: textStyles.label,
                cursorColor: colors.accentPrimary,
                decoration: textFieldDecoration(context).copyWith(
                  hintText: "Поиск",
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            thickness: 1,
            color: colors.separator,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return TimeTableCard(
                  timeTable: findedTables[index],
                  button: IconButton(
                    onPressed: () {},
                    icon: Assets.images.iconSaveOutline.svg(),
                    splashRadius: 24,
                  ),
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1,
                  thickness: 1,
                  color: colors.separator,
                );
              },
              itemCount: findedTables.length,
            ),
          ),
        ],
      ),
    );
  }
}
