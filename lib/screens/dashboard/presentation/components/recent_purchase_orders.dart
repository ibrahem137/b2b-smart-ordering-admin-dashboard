import 'package:dashboard/screens/dashboard/presentation/components/dashboard_card.dart';
import 'package:dashboard/screens/dashboard/presentation/components/purchase_order_tile.dart';
import 'package:dashboard/screens/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';

class RecentPurchaseOrders extends StatelessWidget {
  final List<OrderModel> orders;
  final VoidCallback? onRefresh;

  const RecentPurchaseOrders({super.key, required this.orders, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final recentOrders = orders.take(5).toList();

    return DashboardCard(
      title: 'Recent Purchase Orders',
      icon: Icons.shopping_cart_outlined,
      onRefresh: onRefresh,
      child: recentOrders.isEmpty
          ? Center(
              child: Text(
                'No recent purchase orders.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            )
          : ListView.separated(
              itemCount: recentOrders.length,
              separatorBuilder: (_, _) => const SizedBox(height: 16),
              itemBuilder: (_, index) {
                return PurchaseOrderTile(order: recentOrders[index]);
              },
            ),
    );
  }
}
