import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';
import '../../models/time_interval/time_interval_model.dart';
import '../../models/timetable/timetable_model.dart';
import '../../styles/colors.dart';
import '../../styles/fonts.dart';
import '../lesson_card/card_styles/editable_lesson_card.dart';
import '../lesson_card/card_styles/empty_lesson_card.dart';
import '../popup_menu_action.dart';

class TimetableEditorPage extends StatelessWidget {
  TimetableEditorPage({Key? key, Timetable? editingTimetable})
      : timeTable = editingTimetable ?? Timetable.empty(),
        super(key: key);

  final Timetable timeTable;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textStyles = Theme.of(context).extension<AppTextStyles>()!;

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.backgroundPrimary,
        title: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  padding: const EdgeInsets.only(left: 16),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      // переход назад
                    },
                    icon: SvgPicture.asset(
                      Assets.images.circleChevronLeft.path,
                      color: colors.accentPrimary,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  timeTable.name,
                  style: textStyles.title,
                ),
                Container(
                  width: 42,
                  height: 42,
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      // переход назад
                    },
                    icon: SvgPicture.asset(
                      Assets.images.settings.path,
                      color: colors.accentPrimary,
                    ),
                  ),
                ),
              ],
            ),
            // тут должна быть штука серёги
          ],
        ),
      ),
      body: Column(
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: colors.separator,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
            ),
            child: Row(
              children: [
                Text(
                  'Неделя',
                  style: textStyles.label!.copyWith(
                    color: colors.disable,
                  ),
                ),
                const Spacer(),
                Text(
                  // высчитывать день?
                  timeTable.config.weekTypes[0],
                  style: textStyles.label!.copyWith(
                    color: colors.accentPrimary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: timeTable.days[0].lessons.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 12,
                  );
                },
                itemBuilder: (context, index) {
                  if (timeTable.days[0].lessons[index].isEmpty) {
                    return EmptyLessonCard(
                      index: index,
                      // взять из заданного времени
                      interval: TimeInterval(
                        from: timeTable.config.timeIntervals[index].from,
                        to: timeTable.config.timeIntervals[index].to,
                      ),
                      onTap: () {
                        //переход в редактор пары
                      },
                    );
                  } else {
                    return EditableLessonCard(
                      index: index,
                      // взять из заданного времени
                      interval: TimeInterval(
                        from: timeTable.config.timeIntervals[index].from,
                        to: timeTable.config.timeIntervals[index].to,
                      ),
                      lesson: timeTable.days[0].lessons[index],
                      actions: [
                        // реализовать действия
                        PopupMenuAction(
                          text: "Изменить",
                          icon: const Icon(Icons.edit),
                          action: () {},
                        ),
                        PopupMenuAction(
                          text: "Копировать пару",
                          icon: const Icon(Icons.copy),
                          action: () {},
                        ),
                        PopupMenuAction(
                          text: "Удалить",
                          icon: const Icon(Icons.delete),
                          action: () {},
                          style: PopupMenuActionStyle.destructive,
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
