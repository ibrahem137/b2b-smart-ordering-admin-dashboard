import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/dashboard/data/models/dashboard_overview_response.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrdersStatusChart extends StatelessWidget {
  final DashboardOverviewData overview;

  const OrdersStatusChart({
    super.key,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme
        .extension<DashboardColors>()!;

    final values = <double>[
      overview.ordersSubmitted.toDouble(),
      overview.ordersReceived.toDouble(),
      overview.ordersCancelled.toDouble(),
    ];

    final maxValue = values.fold<double>(
      0,
      (currentMax, value) =>
          value > currentMax ? value : currentMax,
    );

    final maxY = maxValue <= 0
        ? 5.0
        : (maxValue * 1.25).ceilToDouble();

    final titles = [
      'dashboard.submitted'.tr(),
      'dashboard.received'.tr(),
      'dashboard.cancelled'.tr(),
    ];

    return BarChart(
      BarChartData(
        minY: 0,
        maxY: maxY,
        alignment: BarChartAlignment.spaceAround,
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: _gridInterval(maxY),
          getDrawingHorizontalLine: (_) {
            return FlLine(
              color: colors.outlineVariant,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 38,
              interval: _gridInterval(maxY),
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  meta: meta,
                  child: Text(
                    value.toInt().toString(),
                    style: theme.textTheme.bodySmall
                        ?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 36,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();

                if (index < 0 || index >= titles.length) {
                  return const SizedBox.shrink();
                }

                return SideTitleWidget(
                  meta: meta,
                  space: 8,
                  child: Text(
                    titles[index],
                    style: theme.textTheme.bodySmall
                        ?.copyWith(
                          color: colors.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                );
              },
            ),
          ),
        ),
        barGroups: [
          _bar(
            x: 0,
            value: overview.ordersSubmitted.toDouble(),
            color: dashboardColors.warning,
          ),
          _bar(
            x: 1,
            value: overview.ordersReceived.toDouble(),
            color: dashboardColors.success,
          ),
          _bar(
            x: 2,
            value: overview.ordersCancelled.toDouble(),
            color: dashboardColors.cancelled,
          ),
        ],
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (_) => colors.inverseSurface,
            getTooltipItem:
                (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    '${titles[group.x]}\n${rod.toY.toInt()}',
                    TextStyle(
                      color: colors.onInverseSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
          ),
        ),
      ),
    );
  }

  BarChartGroupData _bar({
    required int x,
    required double value,
    required Color color,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          width: 34,
          color: color,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(6),
          ),
        ),
      ],
    );
  }

  double _gridInterval(double maxY) {
    if (maxY <= 5) return 1;
    if (maxY <= 20) return 5;
    if (maxY <= 50) return 10;
    return 20;
  }
}
