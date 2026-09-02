import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/sales/data/models/sale_model.dart';
import 'package:dashboard/screens/sales/presentation/components/sale_status_chip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SaleRow extends StatelessWidget {
  final SaleModel sale;
  final VoidCallback? onView;

  const SaleRow({super.key, required this.sale, this.onView});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme.extension<DashboardColors>()!;

    final total = double.tryParse(sale.total) ?? 0.0;

    final totalCost = double.tryParse(sale.totalCost) ?? 0.0;

    final profit = double.tryParse(sale.profit) ?? 0.0;

    final paidAmount = double.tryParse(sale.paidAmount) ?? 0.0;

    final profitPercentage = totalCost > 0 ? (profit / totalCost) * 100 : 0.0;

    final profitColor = profit >= 0 ? dashboardColors.success : colors.error;

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
                  'SALE-${sale.id.toString().padLeft(4, '0')}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  _formatDateTime(sale.createdAt),
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
                  sale.store?.name ?? 'Unknown Store',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${sale.storeId}',
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
                  sale.customer?.name ?? 'Unknown Customer',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${sale.customerId}',
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
              '\$${total.toStringAsFixed(2)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: dashboardColors.success,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Text(
              '\$${totalCost.toStringAsFixed(2)}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: profitColor.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                '${profit >= 0 ? '+' : ''}'
                '\$${profit.toStringAsFixed(2)} '
                '(${profitPercentage.toStringAsFixed(1)}%)',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: profitColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),

          Expanded(
            child: Text(
              '\$${paidAmount.toStringAsFixed(2)}',
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
              child: SaleStatusChip(status: sale.status),
            ),
          ),

          Expanded(
            child: Text(
              _formatDate(sale.createdAt),
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
