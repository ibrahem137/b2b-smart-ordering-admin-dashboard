import 'package:flutter/material.dart';

abstract final class DashInputTheme {
  DashInputTheme._();

  static InputDecorationTheme build(ColorScheme colors) {
    OutlineInputBorder border(Color color) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: color),
      );
    }

    return InputDecorationTheme(
      filled: true,
      fillColor: colors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: TextStyle(color: colors.onSurfaceVariant),
      labelStyle: TextStyle(color: colors.onSurfaceVariant),
      border: border(colors.outlineVariant),
      enabledBorder: border(colors.outlineVariant),
      focusedBorder: border(colors.primary),
      errorBorder: border(colors.error),
      focusedErrorBorder: border(colors.error),
    );
  }
}
