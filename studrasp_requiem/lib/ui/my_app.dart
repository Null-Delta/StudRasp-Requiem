import 'package:flutter/material.dart';
import '../styles/build_context_extension.dart';
import '../styles/fonts.dart';
import '../styles/time_picker_theme.dart';
import '../styles/colors.dart';
import 'timetable_editor_page/timetable_editor_page.dart';
import 'timetable_page/timetable_page.dart';
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
      theme: ThemeData.light().copyWith(
        backgroundColor: lightColors.backgroundPrimary,
        scaffoldBackgroundColor: lightColors.backgroundPrimary,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              backgroundColor: appLightColors.backgroundPrimary,
              foregroundColor: appLightColors.accentPrimary,
              elevation: 0,
            ),
        iconTheme: ThemeData.light().iconTheme.copyWith(
              color: appLightColors.accentPrimary,
            ),
        textSelectionTheme: TextSelectionThemeData(selectionColor: lightColors.disable!.withOpacity(0.25)),
        splashColor: lightColors.separator,
        hoverColor: lightColors.separator,
        highlightColor: lightColors.backgroundSecondary,
        timePickerTheme: appPickerTheme(lightColors, AppDefaultTextStyles(lightColors)),
        extensions: [
          lightColors,
          AppDefaultTextStyles(lightColors),
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        backgroundColor: darkColors.backgroundPrimary,
        scaffoldBackgroundColor: darkColors.backgroundPrimary,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
              backgroundColor: appDarkColors.backgroundPrimary,
              foregroundColor: appDarkColors.accentPrimary,
              elevation: 0,
            ),
        iconTheme: ThemeData.dark().iconTheme.copyWith(
              color: appDarkColors.accentPrimary,
            ),
        textSelectionTheme: TextSelectionThemeData(selectionColor: darkColors.disable!.withOpacity(0.25)),
        splashColor: darkColors.separator,
        hoverColor: darkColors.separator,
        highlightColor: darkColors.backgroundSecondary,
        timePickerTheme: appPickerTheme(darkColors, AppDefaultTextStyles(darkColors)),
        extensions: [
          darkColors,
          AppDefaultTextStyles(darkColors),
        ],
      ),
      home: TimetableEditorPage(),
    );
  }
}
