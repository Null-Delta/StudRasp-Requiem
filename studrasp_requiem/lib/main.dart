import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studrasp_requiem/support/firebase.dart';
import 'support/logger.dart';

import 'support/error_handler.dart';
import 'ui/my_app.dart';

void main() {
  runZonedGuarded(
    () async {
      await initFirebase();

      initLogger();
      logger.info('Start main');

      ErrorHandler.init();

      runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      );
    },
    ErrorHandler.recordError,
  );
}
