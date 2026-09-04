import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/supplier_products/data/models/supplier_product_model.dart';
import 'package:easy_localization/easy_localization.dart';
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
          Expanded(
            flex: 3,
            child: Row(
              children: [
                _SupplierProductImage(
                  imageUrl: product.imageUrl ?? product.product?.imageUrl,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.product?.name ??
                            'supplier_products.unknown_product'.tr(),
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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

          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.supplier?.name ??
                      'supplier_products.unknown_supplier'.tr(),
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

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

          Expanded(
            child: Text(
              '\$ ${product.buyPrice}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: dashboardColors.success,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            child: Text(
              product.stockQuantity.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(flex: 2, child: _StatusBadge(status: product.status)),

          Expanded(
            flex: 2,
            child: Text(
              _formatDate(product.updatedAt),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
                fontSize: 13,
              ),
            ),
          ),

          SizedBox(
            width: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  tooltip: 'common.edit'.tr(),
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 19,
                    color: colors.primary,
                  ),
                ),
                IconButton(
                  tooltip: 'common.delete'.tr(),
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
            Flexible(
              child: Text(
                _label(normalized),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  color: foreground,
                  fontWeight: FontWeight.w600,
                ),
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
        return 'supplier_products.status.available'.tr();

      case 'unavailable':
        return 'supplier_products.status.unavailable'.tr();

      case 'archived':
        return 'supplier_products.status.archived'.tr();

      default:
        return status;
    }
  }
}

class _SupplierProductImage extends StatelessWidget {
  final String? imageUrl;

  const _SupplierProductImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final url = imageUrl?.trim();
    final hasImage = url != null && url.isNotEmpty;

    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: hasImage
          ? Image.network(
              url,
              fit: BoxFit.cover,
              webHtmlElementStrategy: WebHtmlElementStrategy.fallback,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return Center(
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colors.primary,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return _buildPlaceholder(context);
              },
            )
          : _buildPlaceholder(context),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: Icon(
        Icons.inventory_2_outlined,
        size: 20,
        color: colors.onPrimaryContainer,
      ),
    );
  }
}
