import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_auth.dart';
import 'auth_page/auth_page.dart';
import 'auth_page/auth_user_page.dart';
import 'lesson_editor_page/lesson_editor_page.dart';
import 'timetable_editor_page/timetable_editor_page.dart';
import 'timetable_list_pages/timetable_list_page.dart';
import 'timetable_page/timetable_page.dart';
import '../styles/app_theme.dart';
import '../styles/colors.dart';
import 'package:go_router/go_router.dart';

import 'timetable_settings_page/timetable_settings_page.dart';
import 'user_profile_page/user_profile_page.dart';

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
          return HomePage();
        },
        routes: [
          GoRoute(
            name: 'editor',
            path: 'editor',
            builder: (BuildContext context, GoRouterState state) {
              return const TimetableEditorPage();
            },
            routes: [
              GoRoute(
                name: 'lesson',
                path: 'lesson',
                builder: (BuildContext context, GoRouterState state) {
                  return const LessonEditorPage();
                },
              ),
              GoRoute(
                name: 'timetable-settings',
                path: 'settings',
                builder: (BuildContext context, GoRouterState state) {
                  return const TimetableSettingsPage();
                },
              ),
            ],
          ),
          //Ясно SearchPage говна поел
          // GoRoute(
          //   name: 'searh',
          //   path: 'searh',
          // ),
          GoRoute(
            name: 'list',
            path: 'list',
            builder: (BuildContext context, GoRouterState state) {
              return const TimetableListPage();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/auth',
        builder: (BuildContext context, GoRouterState state) {
          return const AuthPage();
        },
      ),
      GoRoute(
        path: '/profile',
        redirect: (state) {
          if (!ref.read(userAuth).isRegistered) return '/auth';
          return null;
        },
        builder: (BuildContext context, GoRouterState state) {
          return const UserProfilePage();
        },
        routes: [
          GoRoute(
            name: 'profile-list',
            path: 'list',
            builder: (BuildContext context, GoRouterState state) {
              return const TimetableListPage();
            },
          ),
        ],
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

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  final pages = [
    const TimetablePage(),
    const AuthUserPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).extension<AppColors>()!;
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
            // if (value == 0) {
            //   context.go('/');
            // } else {
            //   context.go('/profile');
            // }

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
