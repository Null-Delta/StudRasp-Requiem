import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'support/logger.dart';

import 'support/error_handler.dart';
import 'ui/my_app.dart';

import 'firebase_options.dart';

void main() {
  Intl.defaultLocale = 'ru_RU';

  runZonedGuarded(
    () async {
      // await initFirebase();
      WidgetsFlutterBinding.ensureInitialized();

      initLogger();
      logger.info('Start main');

      ErrorHandler.init();
      await Intl.withLocale('ru_RU', () {});
      // await initializeDateFormatting();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      );
    },
    ErrorHandler.recordError,
  );
}
