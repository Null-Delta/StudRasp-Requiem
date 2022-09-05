import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../gen/assets.gen.dart';
import '../../models/timetable/timetable_model.dart';
import '../../providers/current_timetable.dart';
import '../../providers/my_timetables.dart';
import '../../providers/providers.dart';
import '../../styles/build_context_extension.dart';
import '../my_app.dart';
import '../timetable_editor_page/timetable_editor_page.dart';
import 'widgets/time_table_card.dart';

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
              icon: Assets.images.iconEditOutline
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
                        Container(
                          alignment: Alignment.center,
                          height: 128,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: colors.accentPrimary,
                              border: Border.all(),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
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
                              child: Text(
                                "Создать первое расписание",
                                style: textStyles.label!
                                    .copyWith(color: colors.backgroundPrimary),
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
                            iconSize: 24,
                            icon: Assets.images.moreHorizontal
                                .svg(color: colors.accentPrimary),
                            onSelected: (value) {
                              if (value == 0) {
                                Navigator.pop(context);
                              } else if (value == 1) {
                                goToEditorPage(myTables[index]);
                              } else {}
                            },
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: 0,
                                  onTap: () {
                                    ref
                                        .read(localStorage.notifier)
                                        .save(myTables[index]);
                                  },
                                  child: const Text("Использовать"),
                                ),
                                const PopupMenuItem(
                                  value: 1,
                                  child: Text("Изменить"),
                                ),
                                PopupMenuItem(
                                  value: 2,
                                  child: const Text("Удалить"),
                                  onTap: () {
                                    final id = myTables[index].id;
                                    ref
                                        .read(globalRepositoryStore)
                                        .deleteTimetable(id);
                                    setState(() {
                                      myTables.removeWhere(
                                        (table) => table.id == id,
                                      );
                                    });
                                  },
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