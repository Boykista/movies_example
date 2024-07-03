import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class Utils {
  Future<void> sleep({
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    return Future.delayed(duration);
  }

  String formatDate(
    DateTime date, {
    String format = 'd.M.yyyy.',
    String locale = 'en_US',
  }) {
    return DateFormat(format, locale).format(date);
  }

  bool hasTextOverflown(
    String text, {
    required int maxLines,
    required double maxWidth,
    TextScaler textScaler = TextScaler.noScaling,
    TextStyle? style,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style,
      ),
      textScaler: textScaler,
      maxLines: maxLines,
      textDirection: ui.TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    return textPainter.didExceedMaxLines;
  }
}
