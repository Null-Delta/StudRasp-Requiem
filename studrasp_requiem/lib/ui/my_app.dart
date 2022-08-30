import 'package:flutter/material.dart';
import 'timetable_page/timetable_page.dart';

import '../models/lesson/lesson_model.dart';
import '../models/time_interval/time_interval_model.dart';
import '../styles/colors.dart';
import 'empty_lesson_card.dart';
import 'lesson_card.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    const lesson = Lesson(
        name: "Дискретная математика",
        type: "Практика",
        teacher: "Жук А.С.",
        audience: "A305");
    final lesson2 = Lesson.empty();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: colors.backgroundPrimary!,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LessonCard(
                index: 1,
                interval: TimeInterval(
                    from: DateTime.now(),
                    to: DateTime.now().add(const Duration(minutes: 10))),
                lesson: lesson,
              ),
              const SizedBox(
                height: 12,
              ),
              EmptyLessonCard(
                index: 2,
                interval: TimeInterval(
                    from: DateTime.now(),
                    to: DateTime.now().add(const Duration(minutes: 10))),
              ),
              const SizedBox(
                height: 12,
              ),
              LessonCard(
                index: 1,
                interval:
                    TimeInterval(from: DateTime.now(), to: DateTime.now()),
                lesson: lesson,
                isEditable: true,
              ),
              const SizedBox(
                height: 12,
              ),
              LessonCard(
                index: 1,
                interval:
                    TimeInterval(from: DateTime.now(), to: DateTime.now()),
                lesson: lesson,
                showDeadline: true,
              ),
              const SizedBox(
                height: 12,
              ),
              LessonCard(
                index: 1,
                interval:
                    TimeInterval(from: DateTime.now(), to: DateTime.now()),
                lesson: lesson,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
