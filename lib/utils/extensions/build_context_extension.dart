import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);

  ColorScheme get colorScheme => themeData.colorScheme;

  Color get textColor => themeData.textTheme.bodyMedium!.color!;

  Size get screenSize => MediaQuery.sizeOf(this);

  double get keyboardInset => MediaQuery.viewInsetsOf(this).bottom;

  bool get isKeyboardShown => keyboardInset > 0;

  EdgeInsets get screenInsets => MediaQuery.viewPaddingOf(this);

  Locale get currentLocale => Localizations.localeOf(this);

  CupertinoThemeData get cupertinoTheme => CupertinoTheme.of(this);

  TextScaler get textScaler => MediaQuery.textScalerOf(this);
}
