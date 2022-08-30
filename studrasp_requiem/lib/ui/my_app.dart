import 'package:flutter/material.dart';

import '../models/lesson/lesson_model.dart';
import '../styles/colors.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: colors.backgroundPrimary!,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: LessonCard(
                lesson: Lesson(
                  name: 'Алгебра',
                  type: 'Лекция',
                  teacher: 'Иванов И.И.',
                  audience: '105',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
