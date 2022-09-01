import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../models/time_interval/time_interval_model.dart';
import '../../models/user/user_model.dart';
import '../../styles/build_context_extension.dart';
import '../../styles/button_style.dart';
import '../../styles/text_field_style.dart';
import 'action_header.dart';
import 'editor_card.dart';
import 'labeled_text.dart';
import 'lesson_interval_picker.dart';

class TimeTableSettingsPage extends StatelessWidget {
  const TimeTableSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

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
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Assets.images.circleChevronLeft.svg(color: colors.accentPrimary),
          splashRadius: 24,
        ),
        title: Text(
          "Параметры",
          style: textStyles.title,
        ),
      ),
      body: SafeArea(
        maintainBottomViewPadding: false,
        bottom: true,
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
                    style: textStyles.label,
                    cursorColor: colors.accentPrimary,
                    decoration: textFieldDecoration(context).copyWith(
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
                    style: textStyles.label,
                    cursorColor: colors.accentPrimary,
                    decoration: textFieldDecoration(context).copyWith(
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
                    style: textStyles.label,
                    cursorColor: colors.accentPrimary,
                    decoration: textFieldDecoration(context).copyWith(
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
                itemCount: 8,
                itemBuilder: (context, index) {
                  return LessonIntervalPicker(
                    index: index,
                    interval: TimeInterval(
                      from: Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute),
                      to: Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute + 10),
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
              ActionHeader(
                title: "Редакторы",
                action: IconButton(
                  onPressed: () {},
                  icon: Assets.images.iconPlusOutline.svg(
                    color: colors.accentPrimary,
                    width: 24,
                    height: 24,
                  ),
                  iconSize: 24,
                  splashRadius: 24,
                ),
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return const EditorCard(
                    user: User(id: "0", name: "JakeApps", avatarUrl: ""),
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
              const LabeledText(label: "Дата создания", text: "23 Сентября"),
              const LabeledText(label: "Последнее изменение", text: "24 Сентября"),
            ],
          ),
        ),
      ),
    );
  }
}
