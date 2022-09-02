import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../gen/assets.gen.dart';
import '../../models/timetable_config/timetable_config_model.dart';
import '../../models/user/user_model.dart';
import '../../providers/providers.dart';
import '../../styles/build_context_extension.dart';
import '../search_page/search_page.dart';
import 'action_header.dart';
import 'editor_card.dart';
import 'labeled_text.dart';
import 'lesson_interval_picker.dart';

class TimetableSettingsPage extends ConsumerStatefulWidget {
  const TimetableSettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<TimetableSettingsPage> createState() =>
      _TimeTableSettingsPageState();
}

class _TimeTableSettingsPageState extends ConsumerState<TimetableSettingsPage> {
  final TextEditingController nameFieldController = TextEditingController();
  final TextEditingController firstWeekFieldController =
      TextEditingController();
  final TextEditingController secondWeekFieldController =
      TextEditingController();

  List<LessonIntervalController> lessonControllers = [];
  List<User> editors = [];

  void saveChanges() {
    ref.read(currentEditingTimetable.notifier).update(
      (state) {
        return state.copyWith(
          name: nameFieldController.text,
          lastUpdateDate: DateTime.now(),
          editors: editors,
          config: TimetableConfig(
            timeIntervals: lessonControllers.map((e) => e.interval).toList(),
            weekTypes: [
              firstWeekFieldController.text,
              secondWeekFieldController.text,
            ],
            lessonTypes: [],
          ),
        );
      },
    );

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    final timetable = ref.read(currentEditingTimetable);

    nameFieldController.text = timetable.name;
    firstWeekFieldController.text = timetable.config.weekTypes[0];
    secondWeekFieldController.text = timetable.config.weekTypes[1];

    lessonControllers = timetable.config.timeIntervals.map((interval) {
      return LessonIntervalController(interval);
    }).toList();

    editors = timetable.editors;
  }

  void openEditorSearch() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SearchPage<User>(
            filter: (name) {
              int count = Random().nextInt(20);
              return List<User>.generate(
                count,
                (index) => User(
                  id: "${Random().nextInt(100)}",
                  name: "user ${Random().nextInt(100)}",
                  email: '',
                  isVerified: false,
                ),
              );
            },
            itemBuilder: (user) {
              return EditorCard(
                user: user,
                onTap: () {
                  setState(() {
                    editors = [...editors, user];
                  });

                  Navigator.pop(context);
                },
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    final creationDate = ref.read(currentEditingTimetable).creationDate;
    final lastUpdateDate = ref.read(currentEditingTimetable).lastUpdateDate;

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: colors.separator,
            height: 1.0,
          ),
        ),
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            saveChanges();
          },
          icon:
              Assets.images.circleChevronLeft.svg(color: colors.accentPrimary),
          splashRadius: 24,
        ),
        title: Text(
          "Параметры",
          style: textStyles.title,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 16),
              const ActionHeader(title: "Название расписания"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 42,
                  child: TextField(
                    controller: nameFieldController,
                    style: textStyles.label,
                    cursorColor: colors.accentPrimary,
                    decoration: const InputDecoration(
                      hintText: "Название",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const ActionHeader(title: "Название недель"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 42,
                  child: TextField(
                    controller: firstWeekFieldController,
                    style: textStyles.label,
                    cursorColor: colors.accentPrimary,
                    decoration: const InputDecoration(
                      hintText: "Первая",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 42,
                  child: TextField(
                    controller: secondWeekFieldController,
                    style: textStyles.label,
                    cursorColor: colors.accentPrimary,
                    decoration: const InputDecoration(
                      hintText: "Вторая",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const ActionHeader(title: "Время проведения пар"),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: lessonControllers.length,
                itemBuilder: (context, index) {
                  return LessonIntervalPicker(
                    index: index + 1,
                    controller: lessonControllers[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    thickness: 1,
                    color: colors.separator,
                  );
                },
              ),
              const SizedBox(height: 12),
              ActionHeader(
                title: "Редакторы",
                action: IconButton(
                  onPressed: () {
                    openEditorSearch();
                  },
                  icon: Assets.images.iconPlusOutline.svg(
                    color: colors.accentPrimary,
                    width: 24,
                    height: 24,
                  ),
                  iconSize: 24,
                  splashRadius: 24,
                ),
              ),
              if (editors.isEmpty)
                Container(
                  alignment: Alignment.center,
                  height: 64,
                  child: Text(
                    "Список пуст",
                    style: textStyles.label!.copyWith(
                      color: colors.disable,
                    ),
                  ),
                )
              else
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: editors.length,
                  itemBuilder: (context, index) {
                    return EditorCard(
                      user: editors[index],
                      onTap: () {},
                      action: IconButton(
                        onPressed: () {
                          setState(() {
                            editors = editors
                                .where(
                                  (element) => element.id != editors[index].id,
                                )
                                .toList();
                          });
                        },
                        icon: Assets.images.trashFull.svg(
                          color: colors.destructive,
                          width: 20,
                          height: 20,
                        ),
                        iconSize: 24,
                        splashRadius: 24,
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
                ),
              const SizedBox(height: 12),
              const ActionHeader(title: "Информация"),
              LabeledText(
                label: "Дата создания",
                text: DateFormat('d MMM hh:mm').format(creationDate),
              ),
              LabeledText(
                label: "Последнее изменение",
                text: DateFormat('d MMM hh:mm').format(lastUpdateDate),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
