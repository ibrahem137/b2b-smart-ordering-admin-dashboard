import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/dashboard/data/models/top_stores_response.dart';
import 'package:dashboard/screens/dashboard/presentation/components/dashboard_card.dart';
import 'package:flutter/material.dart';

class TopStoresCard extends StatelessWidget {
  final List<TopStoreItem> stores;
  final VoidCallback? onRefresh;

  const TopStoresCard({super.key, required this.stores, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme.extension<DashboardColors>()!;

    return DashboardCard(
      title: 'Top Stores',
      icon: Icons.storefront_outlined,
      onRefresh: onRefresh,
      child: stores.isEmpty
          ? Center(
              child: Text(
                'No store sales data available.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            )
          : ListView.separated(
              itemCount: stores.length,
              separatorBuilder: (_, _) =>
                  Divider(height: 1, color: colors.outlineVariant),
              itemBuilder: (context, index) {
                final item = stores[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colors.primary.withValues(alpha: .10),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '#${index + 1}',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: colors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.store?.name ?? 'Unknown Store',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.store?.email ?? '—',
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
                            '\$${item.totalSales.toStringAsFixed(2)}',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: dashboardColors.success,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Sales',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '+\$${item.totalProfit.toStringAsFixed(2)}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: dashboardColors.success,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Profit',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colors.onSurfaceVariant,
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
