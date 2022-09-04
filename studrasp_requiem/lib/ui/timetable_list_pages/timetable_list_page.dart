import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/assets.gen.dart';
import '../../models/timetable/timetable_model.dart';
import '../../models/timetable_config/timetable_config_model.dart';
import '../../models/user/user_model.dart';
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
  ScrollController myTimeTablesContoller = ScrollController();

  List<Timetable> savedTables = [];
  List<Timetable> myTables = [];

  @override
  void initState() {
    super.initState();
    loadSavedTables();
  }

  Future<void> loadSavedTables() async {
    final savedList = ref.read(localStorage).savedTimetables;
    final repository = ref.read(globalRepositoryStore);

    final newList = await repository.getTimetablesOnId(savedList) ?? [];

    setState(() {
      savedTables = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final textStyles = context.textStyles;

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
                  unselectedLabelStyle: textStyles.label!.copyWith(color: colors.accentPrimary),
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
                      await loadSavedTables();
                    },
                    child: savedTables.isEmpty
                        ? Container(
                            alignment: Alignment.center,
                            height: 128,
                            child: Text(
                              "Список пуст",
                              style: textStyles.label!.copyWith(color: colors.disable),
                            ),
                          )
                        : ListView.separated(
                            physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics(),
                            ),
                            controller: savedTimeTablesContoller,
                            itemBuilder: (context, index) {
                              return TimetableCard(
                                timeTable: savedTables[index],
                                button: IconButton(
                                  onPressed: () {},
                                  icon: Assets.images.moreHorizontal.svg(color: colors.accentPrimary),
                                  splashRadius: 24,
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
                  ListView.separated(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    controller: myTimeTablesContoller,
                    itemBuilder: (context, index) {
                      return TimetableCard(
                        timeTable: myTables[index],
                        button: IconButton(
                          onPressed: () {},
                          icon: Assets.images.moreHorizontal.svg(color: colors.accentPrimary),
                          splashRadius: 24,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const TimetableEditorPage();
                              },
                            ),
                          );
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
