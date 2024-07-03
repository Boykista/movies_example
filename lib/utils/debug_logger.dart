import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class DebugLogger {
  static final _logger = Logger();

  static void log(Object? object, {Level logLevel = Level.debug}) {
    if (kDebugMode) {
      if (object is Exception || object is Error) {
        _logger.e(object);
      } else {
        _logger.log(logLevel, object);
      }
    }
  }
}
