import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../gen/assets.gen.dart';
import '../../../models/timetable/timetable_model.dart';
import '../../../providers/current_timetable.dart';
import '../../../styles/build_context_extension.dart';

class SearchedTableCard extends ConsumerWidget {
  final Timetable timeTable;
  final bool showOwner;
  final Function() onTap;

  const SearchedTableCard({
    Key? key,
    required this.timeTable,
    required this.onTap,
    this.showOwner = true,
  }) : super(key: key);

  //временно тут
  String getDate() {
    DateFormat dateFormat = DateFormat('d MMM');
    return dateFormat.format(timeTable.lastUpdateDate);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final savedTables = ref.watch(localStorage.select((value) => value.savedTimetables));

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
              IconButton(
                onPressed: () {
                  if (savedTables.contains(timeTable.id)) {
                    ref.read(localStorage.notifier).removeFromSavedTimeTables(timeTable.id);
                  } else {
                    ref.read(localStorage.notifier).addToSavedTimeTables(timeTable.id);
                  }
                },
                icon: savedTables.contains(timeTable.id)
                    ? Assets.images.iconSaveSolid.svg(
                        color: colors.accentPrimary,
                      )
                    : Assets.images.iconSaveOutline.svg(
                        color: colors.accentPrimary,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
