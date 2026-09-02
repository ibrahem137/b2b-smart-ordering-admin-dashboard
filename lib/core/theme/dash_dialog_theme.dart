import 'package:flutter/material.dart';

abstract final class DashDialogTheme {
  DashDialogTheme._();

  static DialogThemeData build(ColorScheme colors) {
    return DialogThemeData(
      backgroundColor: colors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titleTextStyle: TextStyle(
        color: colors.onSurface,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      contentTextStyle: TextStyle(color: colors.onSurfaceVariant, fontSize: 14),
    );
  }
}
