import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_auth.dart';
import 'auth_page/auth_user_page.dart';
import 'timetable_page/timetable_page.dart';
import '../styles/app_theme.dart';
import '../styles/colors.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  final appLightColors = const AppLightColors();

  final appDarkColors = const AppDarkColors();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const lightColors = AppLightColors();
    const darkColors = AppDarkColors();

    ref.read(userAuth);

    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: AppTheme.getTheme(lightColors),
      darkTheme: AppTheme.getTheme(darkColors),
      home: HomePage(),
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
