import 'package:flutter/material.dart';

abstract final class Shadows {
  Shadows._();

  static List<BoxShadow> card(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: isDark ? .25 : .08),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ];
  }

  static List<BoxShadow> cardHover(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: isDark ? .35 : .16),
        blurRadius: 20,
        offset: const Offset(0, 8),
      ),
    ];
  }
}
