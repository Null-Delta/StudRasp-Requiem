import 'package:flutter/material.dart';
import '../styles/app_theme.dart';
import '../styles/colors.dart';
import 'timetable_settings_page/timetable_settings_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final appLightColors = const AppLightColors();

  final appDarkColors = const AppDarkColors();

  @override
  Widget build(BuildContext context) {
    const lightColors = AppLightColors();
    const darkColors = AppDarkColors();

    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: AppTheme.getTheme(lightColors),
      darkTheme: AppTheme.getTheme(darkColors),
      home: const TimeTableSettingsPage(),
    );
  }
}
