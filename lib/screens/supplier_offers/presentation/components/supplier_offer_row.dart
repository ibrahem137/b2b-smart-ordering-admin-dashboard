import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/supplier_offers/data/models/supplier_offer_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SupplierOfferRow extends StatelessWidget {
  final SupplierOfferModel offer;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const SupplierOfferRow({
    super.key,
    required this.offer,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme.extension<DashboardColors>()!;

    final supplierProduct = offer.supplierProduct;
    final masterProduct = supplierProduct?.product;

    final directImageUrl = offer.imageUrl?.trim();
    final productImageUrl = masterProduct?.imageUrl?.trim();

    final imageUrl = directImageUrl?.isNotEmpty == true
        ? directImageUrl
        : productImageUrl;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      color: colors.surface,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                _OfferImage(imageUrl: imageUrl),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        masterProduct?.name ?? '—',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'ID: ${offer.id}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              supplierProduct?.supplier?.name ?? '—',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              '\$ ${offer.offerPrice}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: dashboardColors.success,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Expanded(
            child: Text(
              offer.offerStock?.toString() ?? '—',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Expanded(flex: 2, child: _StatusBadge(status: offer.status)),

          Expanded(
            flex: 2,
            child: Text(
              _formatDate(offer.expiresAt),
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
    if (value == null || value.trim().isEmpty) {
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

class _OfferImage extends StatelessWidget {
  final String? imageUrl;

  const _OfferImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final url = imageUrl?.trim() ?? '';
    final hasImage = url.isNotEmpty;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 44,
        height: 44,
        color: colors.surfaceContainerHighest,
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
                  return _placeholder(context);
                },
              )
            : _placeholder(context),
      ),
    );
  }

  Widget _placeholder(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Icon(
      Icons.inventory_2_outlined,
      size: 20,
      color: colors.onSurfaceVariant,
    );
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

    final Color foreground;
    final Color background;

    switch (normalized) {
      case 'available':
        foreground = dashboardColors.success;
        background = dashboardColors.success.withValues(alpha: .10);
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
        child: Text(
          normalized == 'available'
              ? 'Available'
              : normalized == 'unavailable'
              ? 'Unavailable'
              : status,
          style: theme.textTheme.bodySmall?.copyWith(
            color: foreground,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
