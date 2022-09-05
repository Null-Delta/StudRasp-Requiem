import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../gen/assets.gen.dart';
import '../../models/timetable/timetable_model.dart';
import '../../providers/current_timetable.dart';
import '../../providers/my_timetables.dart';
import '../../providers/providers.dart';
import '../../styles/build_context_extension.dart';
import '../../styles/widget_styles.dart';
import '../timetable_editor_page/timetable_editor_page.dart';
import 'widgets/time_table_card.dart';

class TimetableListPage extends ConsumerStatefulWidget {
  const TimetableListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<TimetableListPage> createState() => _TimetableListPageState();
}

class _TimetableListPageState extends ConsumerState<TimetableListPage> {
  ScrollController savedTimeTablesContoller = ScrollController();
  ScrollController myTimeTablesContoller = ScrollController();

  List<Timetable> savedTables = [];

  @override
  void initState() {
    super.initState();
    loadSavedTables(ref.read(localStorage).savedTimetables);
  }

  Future<void> loadSavedTables(List<String> list) async {
    final repository = ref.read(globalRepositoryStore);

    final newList =
        await repository.getTimetablesOnId(list.isEmpty ? [''] : list) ?? [];
    setState(() {
      savedTables = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

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
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              child: Container(
                decoration: BoxDecoration(
                  color: colors.backgroundSecondary,
                  borderRadius: BorderRadiusStyles.large,
                  border: Border.all(color: colors.separator!, width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: TabBar(
                  labelColor: colors.backgroundPrimary,
                  labelStyle: textStyles.label!,
                  unselectedLabelStyle:
                      textStyles.label!.copyWith(color: colors.accentPrimary),
                  unselectedLabelColor: colors.accentPrimary,
                  indicatorWeight: 0,
                  indicator: BoxDecoration(
                    color: colors.accentPrimary,
                    borderRadius: BorderRadiusStyles.normal,
                  ),
                  tabs: [
                    Container(
                      alignment: Alignment.center,
                      height: 36,
                      child: const Text("Сохраненные"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 36,
                      child: const Text("Мои"),
                    ),
                  ],
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
              child: TabBarView(
                children: [
                  RefreshIndicator(
                    onRefresh: () async {
                      await loadSavedTables(
                          ref.read(localStorage).savedTimetables);
                    },
                    child: savedTables.isEmpty
                        ? ListView(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 128,
                                child: Text(
                                  "Список пуст",
                                  style: textStyles.label!
                                      .copyWith(color: colors.disable),
                                ),
                              ),
                            ],
                          )
                        : ListView.separated(
                            physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics(),
                            ),
                            controller: savedTimeTablesContoller,
                            itemBuilder: (context, index) {
                              return TimetableCard(
                                timeTable: savedTables[index],
                                button: PopupMenuButton(
                                  iconSize: 24,
                                  icon: Assets.images.moreHorizontal
                                      .svg(color: colors.accentPrimary),
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        child: const Text("Использовать"),
                                        onTap: () {
                                          ref
                                              .read(localStorage.notifier)
                                              .save(savedTables[index]);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      PopupMenuItem(
                                        value: 1,
                                        child: const Text("Удалить"),
                                        onTap: () {
                                          final id = savedTables[index].id;
                                          ref
                                              .read(localStorage.notifier)
                                              .removeFromSavedTimeTables(id);
                                          setState(() {
                                            savedTables.removeWhere(
                                                (table) => table.id == id);
                                          });
                                        },
                                      ),
                                    ];
                                  },
                                ),
                                onTap: () {
                                  ref
                                      .read(localStorage.notifier)
                                      .save(savedTables[index]);
                                  Navigator.pop(context);
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
                            itemCount: savedTables.length,
                          ),
                  ),
                  myTables.isEmpty
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
                                    style: textStyles.label!.copyWith(
                                        color: colors.backgroundPrimary),
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
                          controller: myTimeTablesContoller,
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return TimetableEditorPage(
                                            timeTable: myTables[index],
                                          );
                                        },
                                      ),
                                    );
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
                                              (table) => table.id == id);
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
                                Navigator.pop(context);
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
