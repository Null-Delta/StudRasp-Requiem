import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../gen/assets.gen.dart';
import '../../models/timetable/timetable_model.dart';
import '../../providers/current_timetable.dart';
import '../../providers/my_timetables.dart';
import '../../providers/providers.dart';
import '../../styles/build_context_extension.dart';
import '../../styles/widget_styles.dart';
import '../my_app.dart';
import '../timetable_editor_page/timetable_editor_page.dart';
import '../widgets/popup_menu_action.dart';
import 'widgets/time_table_card.dart';

import 'package:flutter_share/flutter_share.dart';

class EditableTimetableListPage extends ConsumerStatefulWidget {
  const EditableTimetableListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<EditableTimetableListPage> createState() =>
      _EditableTimetableListPageState();
}

class _EditableTimetableListPageState
    extends ConsumerState<EditableTimetableListPage> {
  ScrollController myTimeTablesController = ScrollController();

  bool showDivider = false;

  void onScroll() {
    if (myTimeTablesController.offset > 0 && !showDivider) {
      setState(() {
        showDivider = true;
      });
    } else if (myTimeTablesController.offset <= 0 && showDivider) {
      setState(() {
        showDivider = false;
      });
    }
  }

  void goToEditorPage([Timetable? timetable]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TimetableEditorPage(
            timeTable: timetable,
          );
        },
      ),
    );
  }

  void goToMainPage() {
    ref.read(indexInBottomNavigationBar.notifier).state = 0;
    Navigator.pop(context);
  }

  Future<void> shareTimetable(Timetable timetable) async {
    await FlutterShare.share(
      title: 'Поделиться расписанием',
      text: 'Расписание ${timetable.name}',
      linkUrl: 'https://studrasp-4e58d.web.app/#/timetable/${timetable.id}',
      chooserTitle: 'Поделиться расписанием',
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    myTimeTablesController.addListener(onScroll);
    List<Timetable> myTables = ref.watch(myTimetables);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: colors.backgroundPrimary,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Assets.images.circleChevronLeft
                  .svg(color: colors.accentPrimary),
              splashRadius: 24,
            ),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                goToEditorPage();
              },
              icon: Assets.images.iconPlusOutline
                  .svg(color: colors.accentPrimary),
              color: colors.accentPrimary,
              splashRadius: 24,
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Мои расписания",
                style: textStyles.largeTitle!,
              ),
            ),
            const SizedBox(height: 16),
            if (showDivider)
              Divider(
                height: 1,
                thickness: 1,
                color: colors.separator,
              ),
            Expanded(
              child: myTables.isEmpty
                  ? ListView(
                      children: [
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          height: 256,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: colors.backgroundPrimary,
                              border: Border.all(
                                color: colors.separator!,
                                width: 1,
                              ),
                              borderRadius: BorderRadiusStyles.normal,
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const TimetableEditorPage();
                                    },
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  "Создать первое расписание",
                                  style: textStyles.label,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      controller: myTimeTablesController,
                      itemBuilder: (context, index) {
                        return TimetableCard(
                          timeTable: myTables[index],
                          button: PopupMenuButton(
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            position: PopupMenuPosition.under,
                            iconSize: 24,
                            elevation: 16,
                            splashRadius: 1,
                            icon: Assets.images.moreHorizontal
                                .svg(color: colors.accentPrimary),
                            onSelected: (value) {
                              if (value == 0) {
                                ref
                                    .read(localStorage.notifier)
                                    .save(myTables[index]);
                                goToMainPage();
                              } else if (value == 1) {
                                goToEditorPage(myTables[index]);
                              } else if (value == 2) {
                                final id = myTables[index].id;
                                ref
                                    .read(globalRepositoryStore)
                                    .deleteTimetable(id);
                                setState(() {
                                  myTables.removeWhere(
                                    (table) => table.id == id,
                                  );
                                });
                              } else if (value == 3) {
                                shareTimetable(myTables[index]);
                              }
                            },
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  value: 0,
                                  child: PopupMenuAction(
                                    text: 'Использовать',
                                    icon: Icon(Icons.playlist_add_check),
                                  ),
                                ),
                                if (Platform.isAndroid || Platform.isIOS)
                                  const PopupMenuItem(
                                    value: 3,
                                    child: PopupMenuAction(
                                      text: 'Поделиться',
                                      icon: Icon(Icons.ios_share_outlined),
                                    ),
                                  ),
                                PopupMenuItem(
                                  value: 1,
                                  child: PopupMenuAction(
                                    text: 'Изменить',
                                    svgIcon: Assets.images.iconEditOutline
                                        .svg(color: colors.accentPrimary),
                                  ),
                                ),
                                const PopupMenuItem(
                                  value: 2,
                                  child: PopupMenuAction(
                                    text: 'Удалить',
                                    icon: Icon(Icons.delete),
                                    style: PopupMenuActionStyle.destructive,
                                  ),
                                ),
                              ];
                            },
                          ),
                          onTap: () {
                            ref
                                .read(localStorage.notifier)
                                .save(myTables[index]);
                            goToMainPage();
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 1,
                          thickness: 1,
                          color: colors.separator,
                        );
                      },
                      itemCount: myTables.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
