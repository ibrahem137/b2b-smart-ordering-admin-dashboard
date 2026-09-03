import 'package:dashboard/screens/dashboard/data/models/sales_trend_response.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SalesOverTimeChart extends StatelessWidget {
  final List<SalesTrendItem> data;

  const SalesOverTimeChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    if (data.isEmpty) {
      return Center(
        child: Text(
          'dashboard.no_sales_data'.tr(),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      );
    }

    final spots = <FlSpot>[];
    var maxY = 0.0;

    for (var i = 0; i < data.length; i++) {
      final total = double.tryParse(data[i].total) ?? 0.0;

      if (total > maxY) {
        maxY = total;
      }

      spots.add(FlSpot(i.toDouble(), total));
    }

    final chartMaxY = maxY <= 0
        ? 10.0
        : (maxY * 1.25).ceilToDouble();

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: (data.length - 1).toDouble(),
        minY: 0,
        maxY: chartMaxY,
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: _gridInterval(chartMaxY),
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
              reservedSize: 48,
              interval: _gridInterval(chartMaxY),
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  meta: meta,
                  child: Text(
                    value.toStringAsFixed(0),
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
              interval: 1,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();

                if (index < 0 || index >= data.length) {
                  return const SizedBox.shrink();
                }

                final month = data[index].month;

                return SideTitleWidget(
                  meta: meta,
                  space: 8,
                  child: Text(
                    month,
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
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => colors.inverseSurface,
            getTooltipItems: (spots) {
              return spots.map((spot) {
                final index = spot.x.toInt();

                if (index < 0 || index >= data.length) {
                  return null;
                }

                final item = data[index];
                final total =
                    double.tryParse(item.total) ?? 0.0;
                final profit =
                    double.tryParse(item.profit) ?? 0.0;

                return LineTooltipItem(
                  '${item.month}\n'
                  '${'dashboard.sales'.tr()}: \$${total.toStringAsFixed(2)}\n'
                  '${'dashboard.profit'.tr()}: \$${profit.toStringAsFixed(2)}',
                  TextStyle(
                    color: colors.onInverseSurface,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }).toList();
            },
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: colors.primary,
            barWidth: 3,
            dotData: FlDotData(
              show: true,
              getDotPainter:
                  (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 4,
                      color: colors.primary,
                      strokeWidth: 2,
                      strokeColor: colors.surface,
                    );
                  },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colors.primary.withValues(alpha: .20),
                  colors.primary.withValues(alpha: .02),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _gridInterval(double maxY) {
    if (maxY <= 10) return 2;
    if (maxY <= 50) return 10;
    if (maxY <= 100) return 20;
    if (maxY <= 500) return 100;
    if (maxY <= 1000) return 200;

    return 1000;
  }
}
