import 'package:flutter/material.dart';

import '../styles/fonts.dart';
import 'timetable_editor_page/timetable_editor_page.dart';
import '../styles/colors.dart';

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
        iconTheme: ThemeData.dark().iconTheme.copyWith(
              color: appLightColors.accentPrimary,
            ),
        extensions: [
          const AppLightColors(),
          AppDefaultTextStyles(appLightColors),
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        iconTheme: ThemeData.dark().iconTheme.copyWith(
              color: appDarkColors.accentPrimary,
            ),
        extensions: [
          const AppDarkColors(),
          AppDefaultTextStyles(appDarkColors),
        ],
      ),
      home: TimetableEditorPage(),
    );
  }
}
