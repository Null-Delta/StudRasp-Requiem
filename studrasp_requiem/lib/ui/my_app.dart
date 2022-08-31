import 'package:flutter/material.dart';

import '../styles/fonts.dart';
import '../styles/colors.dart';
import 'timetable_page/timetable_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final appLightColors = const AppLightColors();

  final appDarkColors = const AppDarkColors();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              backgroundColor: appLightColors.backgroundPrimary,
              foregroundColor: appLightColors.accentPrimary,
              elevation: 0,
            ),
        iconTheme: ThemeData.dark().iconTheme.copyWith(
              color: appLightColors.accentPrimary,
            ),
        extensions: [
          const AppLightColors(),
          AppDefaultTextStyles(appLightColors),
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              backgroundColor: appDarkColors.backgroundPrimary,
              foregroundColor: appDarkColors.accentPrimary,
              elevation: 0,
            ),
        iconTheme: ThemeData.dark().iconTheme.copyWith(
              color: appDarkColors.accentPrimary,
            ),
        extensions: [
          const AppDarkColors(),
          AppDefaultTextStyles(appDarkColors),
        ],
      ),
      home: const TimetablePage(),
    );
  }
}
