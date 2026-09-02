import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PurchaseOrderTile extends StatelessWidget {
  final OrderModel order;

  const PurchaseOrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme.extension<DashboardColors>()!;

    final totalBuy = double.tryParse(order.totalBuy) ?? 0.0;

    final statusColor = _getStatusColor(order.status, colors, dashboardColors);

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
                Row(
                  children: [
                    Text(
                      'PO-${order.id.toString().padLeft(4, '0')}',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.onSurface,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: .12),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        _statusLabel(order.status),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  order.supplier?.name ?? 'Unknown Supplier',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  order.store?.name ?? 'Unknown Store',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  _formatDate(order.createdAt),
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
                '\$${totalBuy.toStringAsFixed(2)}',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                'Buy Total',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
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

  Color _getStatusColor(
    String status,
    ColorScheme colors,
    DashboardColors dashboardColors,
  ) {
    switch (status.toLowerCase()) {
      case 'submitted':
        return dashboardColors.warning;

      case 'received':
        return dashboardColors.success;

      case 'cancelled':
        return dashboardColors.cancelled;

      case 'draft':
        return colors.onSurfaceVariant;

      default:
        return colors.onSurfaceVariant;
    }
  }

  String _statusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'submitted':
        return 'Submitted';

      case 'received':
        return 'Received';

      case 'cancelled':
        return 'Cancelled';

      case 'draft':
        return 'Draft';

      default:
        return status;
    }
  }
}
