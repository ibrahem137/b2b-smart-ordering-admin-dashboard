import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SupplierProductTile extends StatelessWidget {
  final SupplierProductModel product;

  const SupplierProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme
        .extension<DashboardColors>()!;

    final price = double.tryParse(product.buyPrice) ?? 0.0;

    final isAvailable =
        product.status.toLowerCase() == 'available';

    final statusColor = isAvailable
        ? dashboardColors.success
        : colors.error;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: .10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              color: colors.primary,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.product?.name ??
                      'dashboard.unknown_product'.tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(
                        color: colors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.supplier?.name ??
                      'dashboard.unknown_supplier'.tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(
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
                    color: statusColor.withValues(
                      alpha: .10,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isAvailable
                        ? 'dashboard.available'.tr()
                        : 'dashboard.unavailable'.tr(),
                    style: theme.textTheme.bodySmall
                        ?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
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
                '\$${price.toStringAsFixed(2)}',
                style: theme.textTheme.titleMedium
                    ?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                '${product.stockQuantity} '
                '${'dashboard.units'.tr()}',
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
}
