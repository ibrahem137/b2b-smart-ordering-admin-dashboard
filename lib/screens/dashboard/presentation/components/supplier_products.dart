import 'package:dashboard/screens/dashboard/presentation/components/dashboard_card.dart';
import 'package:dashboard/screens/dashboard/presentation/components/supplier_product_tile.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SupplierProducts extends StatelessWidget {
  final List<SupplierProductModel> products;
  final VoidCallback? onRefresh;

  const SupplierProducts({
    super.key,
    required this.products,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return DashboardCard(
      title: 'dashboard.supplier_products'.tr(),
      icon: Icons.inventory_2_outlined,
      onRefresh: onRefresh,
      child: products.isEmpty
          ? Center(
              child: Text(
                'dashboard.no_supplier_products'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            )
          : ListView.separated(
              itemCount: products.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: 16),
              itemBuilder: (_, index) {
                return SupplierProductTile(
                  product: products[index],
                );
              },
            ),
    );
  }
}
