import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/sales/data/models/sale_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentSaleTile extends StatelessWidget {
  final SaleModel sale;

  const RecentSaleTile({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme.extension<DashboardColors>()!;

    final amount = double.tryParse(sale.total) ?? 0.0;

    final profit = double.tryParse(sale.profit) ?? 0.0;

    final profitColor = profit >= 0 ? dashboardColors.success : colors.error;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SALE-${sale.id.toString().padLeft(4, '0')}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  sale.store?.name ?? 'Unknown Store',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  sale.customer?.name ?? 'Unknown Customer',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  _formatDate(sale.createdAt),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${amount.toStringAsFixed(2)}',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                '${profit >= 0 ? '+' : ''}\$${profit.toStringAsFixed(2)} profit',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: profitColor,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              _StatusBadge(status: sale.status),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(String? value) {
    if (value == null || value.isEmpty) {
      return '—';
    }

    final date = DateTime.tryParse(value);

    if (date == null) {
      return value;
    }

    return DateFormat('yyyy-MM-dd HH:mm').format(date.toLocal());
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme.extension<DashboardColors>()!;

    final statusColor = _statusColor(status, colors, dashboardColors);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        _statusLabel(status),
        style: theme.textTheme.bodySmall?.copyWith(
          color: statusColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _statusColor(
    String status,
    ColorScheme colors,
    DashboardColors dashboardColors,
  ) {
    switch (status.toLowerCase()) {
      case 'paid':
        return dashboardColors.success;

      case 'pending':
      case 'draft':
        return dashboardColors.warning;

      case 'refunded':
      case 'cancelled':
        return colors.error;

      default:
        return colors.onSurfaceVariant;
    }
  }

  String _statusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return 'Paid';
      case 'pending':
        return 'Pending';
      case 'draft':
        return 'Draft';
      case 'refunded':
        return 'Refunded';
      case 'cancelled':
        return 'Cancelled';
      default:
        return status;
    }
  }
}
