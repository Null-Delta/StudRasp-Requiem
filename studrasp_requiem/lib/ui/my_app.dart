import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/timetable/timetable_model.dart';
import '../providers/current_timetable.dart';
import '../providers/providers.dart';
import '../providers/user_auth.dart';
import '../styles/build_context_extension.dart';
import 'auth_page/auth_user_page.dart';
import 'timetable_page/timetable_page.dart';
import '../styles/app_theme.dart';
import '../styles/colors.dart';
import 'package:go_router/go_router.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final appLightColors = const AppLightColors();

  final appDarkColors = const AppDarkColors();

  late final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/timetable/:tid',
        builder: (BuildContext context, GoRouterState state) {
          return FutureBuilder<List<Timetable>?>(
            future: ref.read(globalRepositoryStore.notifier).state.getTimetablesOnId([state.params['tid']!]),
            builder: (context, snap) {
              if (snap.hasData) {
                return TimetablePage(
                  timetable: snap.data!.isNotEmpty ? snap.data!.first : null,
                );
              }
              if (snap.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }

              return Scaffold(
                body: Center(
                  child: Text(
                    '404 Not Found',
                    style: context.textStyles.largeTitle!,
                  ),
                ),
              );
            },
          );
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    const lightColors = AppLightColors();
    const darkColors = AppDarkColors();

    ref.read(userAuth);

    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: AppTheme.getTheme(lightColors),
      darkTheme: AppTheme.getTheme(darkColors),
    );
  }
}

final indexInBottomNavigationBar = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final pages = [
      TimetablePage(timetable: ref.watch(localStorage.select((value) => value.currentTimetable))),
      const AuthUserPage(),
    ];
    return Scaffold(
      body: pages.elementAt(ref.watch(indexInBottomNavigationBar)),
      // ignore: use_decorated_box
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: colors.separator!,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: ref.read(indexInBottomNavigationBar),
          onTap: (value) {
            ref.read(indexInBottomNavigationBar.notifier).state = value;
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Расписание',
              icon: Icon(Icons.calendar_month_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Профиль',
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
