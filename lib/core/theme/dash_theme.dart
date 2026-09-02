import 'package:dashboard/core/theme/color_schemes.dart';
import 'package:dashboard/core/theme/dash_button_theme.dart';
import 'package:dashboard/core/theme/dash_card_theme.dart';
import 'package:dashboard/core/theme/dash_dialog_theme.dart';
import 'package:dashboard/core/theme/dash_input_theme.dart';
import 'package:dashboard/core/theme/dash_table_theme.dart';
import 'package:dashboard/core/theme/dash_text_theme.dart';
import 'package:dashboard/core/theme/extensions.dart';
import 'package:flutter/material.dart';

abstract final class DashTheme {
  static ThemeData get dark {
    return _build(
      colors: DashColorSchemes.dark,
      extension: DashboardColors.dark,
    );
  }

  static ThemeData get light {
    return _build(
      colors: DashColorSchemes.light,
      extension: DashboardColors.light,
    );
  }

  DashTheme._();

  static ThemeData _build({
    required ColorScheme colors,
    required DashboardColors extension,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: colors.brightness,
      colorScheme: colors,
      scaffoldBackgroundColor: colors.brightness == Brightness.light
          ? const Color(0xFFF8FAFC)
          : const Color(0xFF0F172A),

      textTheme: DashTextTheme.build(colors),

      cardTheme: DashCardTheme.build(colors),

      inputDecorationTheme: DashInputTheme.build(colors),

      filledButtonTheme: DashButtonTheme.filled(colors),

      outlinedButtonTheme: DashButtonTheme.outlined(colors),

      textButtonTheme: DashButtonTheme.text(colors),

      dialogTheme: DashDialogTheme.build(colors),

      dataTableTheme: DashTableTheme.build(colors),

      dividerColor: colors.outlineVariant,

      extensions: [extension],
    );
  }
}
