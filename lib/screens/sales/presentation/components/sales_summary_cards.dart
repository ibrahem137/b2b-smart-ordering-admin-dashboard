import 'package:dashboard/core/theme/extensions.dart';
import 'package:flutter/material.dart';

class SalesSummaryCards extends StatelessWidget {
  final double totalRevenue;
  final int totalSales;
  final double totalProfit;

  const SalesSummaryCards({
    super.key,
    required this.totalRevenue,
    required this.totalSales,
    required this.totalProfit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme.extension<DashboardColors>()!;

    final profitColor = totalProfit >= 0
        ? dashboardColors.success
        : colors.error;

    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            title: 'Total Revenue',
            value: '\$${totalRevenue.toStringAsFixed(2)}',
            icon: Icons.trending_up_rounded,
            iconColor: dashboardColors.success,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _SummaryCard(
            title: 'Total Sales',
            value: totalSales.toString(),
            icon: Icons.inventory_2_outlined,
            iconColor: colors.primary,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: _SummaryCard(
            title: 'Total Profit',
            value: '\$${totalProfit.toStringAsFixed(2)}',
            icon: totalProfit >= 0 ? Icons.trending_up : Icons.trending_down,
            iconColor: profitColor,
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: .10),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
