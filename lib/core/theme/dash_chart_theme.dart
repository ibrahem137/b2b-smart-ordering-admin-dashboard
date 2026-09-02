import 'package:dashboard/core/theme/extensions.dart';
import 'package:flutter/material.dart';

abstract final class DashChartTheme {
  DashChartTheme._();

  static List<Color> palette(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final dashboardColors = Theme.of(context).extension<DashboardColors>()!;

    return [
      colors.primary,
      colors.secondary,
      dashboardColors.success,
      dashboardColors.warning,
      colors.error,
      dashboardColors.preparing,
      dashboardColors.info,
    ];
  }
}
