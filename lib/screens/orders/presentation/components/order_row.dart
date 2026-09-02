import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/orders/data/models/order_model.dart';
import 'package:dashboard/screens/orders/presentation/components/order_status_chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderRow extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onView;

  const OrderRow({super.key, required this.order, this.onView});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme.extension<DashboardColors>()!;

    final totalBuy = double.tryParse(order.totalBuy) ?? 0.0;

    final totalSell = double.tryParse(order.totalSell ?? '') ?? 0.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      color: colors.surface,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PO-${order.id.toString().padLeft(4, '0')}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  _formatDateTime(order.createdAt),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.store?.name ?? 'Unknown Store',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${order.storeId}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.supplier?.name ?? 'Unknown Supplier',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${order.supplierId}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Text(
              '\$${totalBuy.toStringAsFixed(2)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: dashboardColors.success,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Text(
              order.totalSell == null
                  ? '—'
                  : '\$${totalSell.toStringAsFixed(2)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: OrderStatusChip(status: order.status),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              order.notes?.trim().isNotEmpty == true ? order.notes! : '—',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
                fontSize: 13,
              ),
            ),
          ),

          Expanded(
            child: Text(
              _formatDate(order.createdAt),
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurface,
                fontSize: 13,
              ),
            ),
          ),

          SizedBox(
            width: 70,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                tooltip: 'View',
                onPressed: onView,
                icon: Icon(
                  Icons.remove_red_eye_outlined,
                  size: 20,
                  color: colors.onSurfaceVariant,
                ),
              ),
            ),
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

    return DateFormat('yyyy-MM-dd').format(date.toLocal());
  }

  String _formatDateTime(String? value) {
    if (value == null || value.isEmpty) {
      return '—';
    }

    final date = DateTime.tryParse(value);

    if (date == null) {
      return value;
    }

    return DateFormat('yyyy-MM-dd\nHH:mm').format(date.toLocal());
  }
}
