import 'package:flutter/material.dart';

abstract final class DashTableTheme {
  DashTableTheme._();

  static DataTableThemeData build(ColorScheme colors) {
    return DataTableThemeData(
      headingRowColor: WidgetStatePropertyAll(colors.surfaceContainerHighest),
      dataRowColor: WidgetStatePropertyAll(colors.surface),
      headingTextStyle: TextStyle(
        color: colors.onSurface,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      dataTextStyle: TextStyle(color: colors.onSurface, fontSize: 13),
      dividerThickness: 1,
      decoration: BoxDecoration(
        border: Border.all(color: colors.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
