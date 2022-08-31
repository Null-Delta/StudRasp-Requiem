import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../styles/build_context_extension.dart';
import '../styles/fonts.dart';
import '../styles/time_picker_theme.dart';
import '../styles/colors.dart';
import 'timetable_settings_page/timetable_settings_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const lightColors = AppLightColors();
    const darkColors = AppDarkColors();

    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(selectionColor: darkColors.disable!.withOpacity(0.25)),
        splashColor: darkColors.backgroundPrimary,
        hoverColor: darkColors.backgroundPrimary,
        highlightColor: darkColors.backgroundPrimary,
        timePickerTheme: appPickerTheme(darkColors, AppDefaultTextStyles(darkColors)),
        extensions: [
          darkColors,
          AppDefaultTextStyles(darkColors),
        ],
      ),
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(selectionColor: lightColors.disable!.withOpacity(0.25)),
        splashColor: lightColors.backgroundPrimary,
        hoverColor: lightColors.backgroundPrimary,
        highlightColor: lightColors.backgroundPrimary,
        timePickerTheme: appPickerTheme(lightColors, AppDefaultTextStyles(lightColors)),
        extensions: [
          lightColors,
          AppDefaultTextStyles(lightColors),
        ],
      ),
      home: TimeTableSettingsPage(),
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
    final colors = context.colors;
    ;

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
