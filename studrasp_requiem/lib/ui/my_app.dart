import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../styles/fonts.dart';
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
      home: const LessonEditorPage(),
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
