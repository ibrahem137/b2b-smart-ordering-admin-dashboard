import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:flutter/material.dart';

class SupplierProductRow extends StatelessWidget {
  final SupplierProductModel product;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const SupplierProductRow({
    super.key,
    required this.product,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme.extension<DashboardColors>()!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      color: colors.surface,
      child: Row(
        children: [
          /// Product
          Expanded(
            flex: 3,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: colors.primaryContainer,
                  child: Icon(
                    Icons.inventory_2_outlined,
                    size: 18,
                    color: colors.onPrimaryContainer,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.product?.name ?? 'Unknown Product',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'ID: ${product.productId}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Supplier
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.supplier?.name ?? 'Unknown Supplier',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ID: ${product.supplierId}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          /// Category
          Expanded(
            flex: 2,
            child: Text(
              product.product?.category?.name ?? '—',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          /// Buy Price
          Expanded(
            child: Text(
              '\$ ${product.buyPrice}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: dashboardColors.success,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          /// Stock
          Expanded(
            child: Text(
              product.stockQuantity.toString(),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// Status
          Expanded(flex: 2, child: _StatusBadge(status: product.status)),

          /// Updated Date
          Expanded(
            flex: 2,
            child: Text(
              _formatDate(product.updatedAt),
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
                fontSize: 13,
              ),
            ),
          ),

          /// Actions
          SizedBox(
            width: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  tooltip: 'Edit',
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 19,
                    color: colors.primary,
                  ),
                ),
                IconButton(
                  tooltip: 'Delete',
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: colors.error,
                  ),
                ),
              ],
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

    return '${date.year}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
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

    final normalized = status.toLowerCase();

    late final Color foreground;
    late final Color background;

    switch (normalized) {
      case 'available':
        foreground = dashboardColors.success;
        background = dashboardColors.success.withValues(alpha: .10);
        break;

      case 'archived':
        foreground = colors.onSurfaceVariant;
        background = colors.surfaceContainerHighest;
        break;

      case 'unavailable':
        foreground = colors.error;
        background = colors.error.withValues(alpha: .10);
        break;

      default:
        foreground = colors.onSurfaceVariant;
        background = colors.surfaceContainerHighest;
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: foreground,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              _label(normalized),
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 12,
                color: foreground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _label(String status) {
    switch (status) {
      case 'available':
        return 'Available';

      case 'unavailable':
        return 'Unavailable';

      case 'archived':
        return 'Archived';

      default:
        return status;
    }
  }
}
