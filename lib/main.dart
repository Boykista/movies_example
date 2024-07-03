import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_example/app.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      Zone.current.handleUncaughtError(
          errorDetails.exception, errorDetails.stack ?? StackTrace.empty);
    };

    await App.initialize();

    runApp(const App());
  }, (error, stack) {
    FlutterError.dumpErrorToConsole(
      FlutterErrorDetails(exception: error, stack: stack),
    );
  });
}
