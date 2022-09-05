import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../gen/assets.gen.dart';
import '../../models/timetable/timetable_model.dart';
import '../../providers/current_timetable.dart';
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

  List<Timetable> savedTables = [];
  List<Timetable> myTables = [];

  bool showDivider = false;

  @override
  void initState() {
    super.initState();
    loadSavedTables(ref.read(localStorage).savedTimetables);
  }

  Future<void> loadSavedTables(List<String> list) async {
    final repository = ref.read(globalRepositoryStore);

    final newList = await repository.getTimetablesOnId(list.isEmpty ? [''] : list) ?? [];
    setState(() {
      savedTables = newList;
    });
  }

  void onScroll() {
    if (savedTimeTablesContoller.offset > 0 && !showDivider) {
      setState(() {
        showDivider = true;
      });
    } else if (savedTimeTablesContoller.offset <= 0 && showDivider) {
      setState(() {
        showDivider = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    savedTimeTablesContoller.addListener(onScroll);

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
              icon: Assets.images.circleChevronLeft.svg(color: colors.accentPrimary),
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
                "Сохраненные\nрасписания",
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
              child: RefreshIndicator(
                onRefresh: () async {
                  await loadSavedTables(ref.read(localStorage).savedTimetables);
                },
                child: savedTables.isEmpty
                    ? ListView(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 96,
                            child: Text(
                              "Список пуст",
                              style: textStyles.label!.copyWith(color: colors.disable),
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
                              icon: Assets.images.moreHorizontal.svg(color: colors.accentPrimary),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    child: const Text("Использовать"),
                                    onTap: () {
                                      ref.read(localStorage.notifier).save(savedTables[index]);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: 1,
                                    child: const Text("Удалить"),
                                    onTap: () {
                                      final id = savedTables[index].id;
                                      ref.read(localStorage.notifier).removeFromSavedTimeTables(id);
                                      setState(() {
                                        savedTables.removeWhere((table) => table.id == id);
                                      });
                                    },
                                  ),
                                ];
                              },
                            ),
                            onTap: () {
                              ref.read(localStorage.notifier).save(savedTables[index]);
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
            ),
          ],
        ),
      ),
    );
  }
}
