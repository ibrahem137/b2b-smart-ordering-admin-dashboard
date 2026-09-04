import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StoreRow extends StatelessWidget {
  final StoreModel store;
  final VoidCallback? onView;
  final VoidCallback? onToggleStatus;
  final VoidCallback? onDelete;

  const StoreRow({
    super.key,
    required this.store,
    this.onView,
    this.onToggleStatus,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      color: colors.surface,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                _StoreImage(imageUrl: store.imageUrl),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'ID: ${store.id}',
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
              store.ownerName,
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
              store.phone,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Text(
              store.email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),

          Expanded(flex: 2, child: _StoreStatusBadge(status: store.status)),

          SizedBox(
            width: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  tooltip: 'stores.view_details'.tr(),
                  onPressed: onView,
                  icon: Icon(
                    Icons.visibility_outlined,
                    size: 20,
                    color: colors.primary,
                  ),
                ),
                IconButton(
                  tooltip: store.status.toLowerCase() == 'active'
                      ? 'stores.deactivate'.tr()
                      : 'stores.activate'.tr(),
                  onPressed: onToggleStatus,
                  icon: Icon(
                    store.status.toLowerCase() == 'active'
                        ? Icons.block_outlined
                        : Icons.check_circle_outline,
                    size: 20,
                    color: store.status.toLowerCase() == 'active'
                        ? colors.error
                        : theme.extension<DashboardColors>()!.success,
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
}

class _StoreImage extends StatelessWidget {
  final String? imageUrl;

  const _StoreImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final url = imageUrl?.trim() ?? '';

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 46,
        height: 46,
        color: colors.surfaceContainerHighest,
        child: url.isEmpty
            ? _placeholder(context)
            : Image.network(
                url,
                width: double.infinity,
                height: double.infinity,
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
              ),
      ),
    );
  }

  Widget _placeholder(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Icon(
      Icons.storefront_outlined,
      size: 22,
      color: colors.onSurfaceVariant,
    );
  }
}

class _StoreStatusBadge extends StatelessWidget {
  final String status;

  const _StoreStatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final dashboardColors = theme.extension<DashboardColors>()!;

    final isActive = status.toLowerCase() == 'active';

    final foreground = isActive ? dashboardColors.success : colors.error;

    final background = foreground.withValues(alpha: .10);

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
              isActive
                  ? 'stores.status.active'.tr()
                  : 'stores.status.inactive'.tr(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: foreground,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
