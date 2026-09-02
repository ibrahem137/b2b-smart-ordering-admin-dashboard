import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/dashboard/data/models/low_stock_response.dart';
import 'package:dashboard/screens/dashboard/presentation/components/dashboard_card.dart';
import 'package:flutter/material.dart';

class LowStockCard extends StatelessWidget {
  final LowStockData data;
  final VoidCallback? onRefresh;

  const LowStockCard({super.key, required this.data, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme.extension<DashboardColors>()!;

    final items = data.items;

    return DashboardCard(
      title: 'Low Stock',
      icon: Icons.inventory_2_outlined,
      onRefresh: onRefresh,
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: dashboardColors.warning.withValues(alpha: .12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'Threshold: ${data.threshold}',
          style: theme.textTheme.bodySmall?.copyWith(
            color: dashboardColors.warning,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: items.isEmpty
          ? Center(
              child: Text(
                'No low stock items.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            )
          : ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, _) =>
                  Divider(height: 1, color: colors.outlineVariant),
              itemBuilder: (context, index) {
                final item = items[index];

                final stock = item.stockQuantity;

                final isCritical = stock <= 1;

                final statusColor = isCritical
                    ? colors.error
                    : dashboardColors.warning;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: .10),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.warning_amber_rounded,
                          color: statusColor,
                          size: 22,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.product?.name ?? 'Unknown Product',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              item.supplier?.name ?? 'Unknown Supplier',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),

                            const SizedBox(height: 3),

                            Text(
                              item.product?.category?.name ?? 'No Category',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            stock.toString(),
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 3),

                          Text(
                            'units left',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 9,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: statusColor.withValues(alpha: .10),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              isCritical ? 'Critical' : 'Low',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: statusColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
