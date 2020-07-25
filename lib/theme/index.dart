import 'package:flutter/material.dart';
import 'typography.dart';
import 'colors.dart';

ThemeData _buildDreamBodyTheme() {
  final ThemeData base = ThemeData.light();
  final dreamBodyTextTheme = buildDreamBodyTextTheme(base.textTheme);

  return base.copyWith(
    primaryColor: customColor.primaryColor,
    accentColor: customColor.accentColor,
    scaffoldBackgroundColor: customColor.backgroundColor,
    cardColor: customColor.backgroundColor,
    textSelectionColor: customColor.primaryLightColor,
    errorColor: customColor.errorColor,
    textTheme: dreamBodyTextTheme,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}

final ThemeData dreamBodyTheme = _buildDreamBodyTheme();
