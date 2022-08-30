import 'dart:async';

import 'package:flutter/material.dart';
import 'support/logger.dart';

import 'support/error_handler.dart';
import 'ui/my_app.dart';

void main() {
  runZonedGuarded(
    () async {
      // await initFirebase();

      initLogger();
      logger.info('Start main');

      ErrorHandler.init();

      runApp(const MyApp());
    },
    ErrorHandler.recordError,
  );
}
