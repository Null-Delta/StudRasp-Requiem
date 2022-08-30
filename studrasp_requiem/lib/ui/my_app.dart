import 'package:flutter/material.dart';

import '../models/lesson/lesson_model.dart';
import '../styles/colors.dart';
import 'timetable_page/timetable_page.dart';
import 'widgets/lesson_card.dart';

void main() {
  runApp(const MyApp());
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
        extensions: const [AppDarkColors()],
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        extensions: const [AppLightColors()],
      ),
      home: const TimetablePage(),
    );
  }
}
