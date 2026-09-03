import 'package:dashboard/screens/dashboard/presentation/components/dashboard_card.dart';
import 'package:dashboard/screens/dashboard/presentation/components/recent_sale_tile.dart';
import 'package:dashboard/screens/sales/data/models/sale_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RecentSales extends StatelessWidget {
  final List<SaleModel> sales;
  final VoidCallback? onRefresh;

  const RecentSales({
    super.key,
    required this.sales,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final recentSales = sales.take(5).toList();

    return DashboardCard(
      title: 'dashboard.recent_sales'.tr(),
      icon: Icons.attach_money,
      onRefresh: onRefresh,
      child: recentSales.isEmpty
          ? Center(
              child: Text(
                'dashboard.no_recent_sales'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            )
          : ListView.separated(
              itemCount: recentSales.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: 16),
              itemBuilder: (_, index) {
                return RecentSaleTile(
                  sale: recentSales[index],
                );
              },
            ),
    );
  }
}
