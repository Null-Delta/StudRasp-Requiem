import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../styles/fonts.dart';
import 'timetable_editor_page/timetable_editor_page.dart';
import 'timetable_list_pages/tima_table_list_page.dart';
import 'lesson_editor_page/lesson_editor_page.dart';
import 'timetable_page/timetable_page.dart';
import '../styles/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        extensions: [
          const AppDarkColors(),
          AppDefaultTextStyles(const AppDarkColors()),
        ],
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        extensions: [
          const AppLightColors(),
          AppDefaultTextStyles(const AppLightColors()),
        ],
      ),
      home: TimetableEditorPage(),
    );
  }
}
