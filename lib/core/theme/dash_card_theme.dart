import 'package:flutter/material.dart';

abstract final class DashCardTheme {
  DashCardTheme._();

  static CardThemeData build(ColorScheme colors) {
    return CardThemeData(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: colors.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: colors.outlineVariant),
      ),
    );
  }
}
