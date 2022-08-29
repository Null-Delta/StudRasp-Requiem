import 'package:flutter/material.dart';

import '../styles/colors.dart';
import 'day_button.dart';

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              width: 36,
              height: 48,
              child: DayButton(
                style: DayButtonStyle.defalut,
                time: DateTime.now(),
                onSelect: () {},
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 36,
              height: 48,
              child: DayButton(
                style: DayButtonStyle.highlighted,
                time: DateTime.now(),
                onSelect: () {},
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 36,
              height: 48,
              child: DayButton(
                style: DayButtonStyle.selected,
                time: DateTime.now(),
                onSelect: () {},
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
