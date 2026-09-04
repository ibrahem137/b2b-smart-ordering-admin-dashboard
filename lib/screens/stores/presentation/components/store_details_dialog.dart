import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StoreDetailsDialog extends StatelessWidget {
  final StoreModel store;

  const StoreDetailsDialog({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 620),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _StoreImage(imageUrl: store.imageUrl),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          store.name,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: colors.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'ID: ${store.id}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _StatusBadge(status: store.status),
                  const SizedBox(width: 8),
                  IconButton(
                    tooltip: 'common.close'.tr(),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Divider(height: 1, color: colors.outlineVariant),

              const SizedBox(height: 24),

              _InfoRow(
                icon: Icons.person_outline,
                label: 'stores.details.owner'.tr(),
                value: store.ownerName,
              ),

              const SizedBox(height: 18),

              _InfoRow(
                icon: Icons.phone_outlined,
                label: 'stores.details.phone'.tr(),
                value: store.phone,
              ),

              const SizedBox(height: 18),

              _InfoRow(
                icon: Icons.email_outlined,
                label: 'stores.details.email'.tr(),
                value: store.email,
              ),

              const SizedBox(height: 18),

              _InfoRow(
                icon: Icons.location_on_outlined,
                label: 'stores.details.address'.tr(),
                value: _valueOrDash(store.address),
              ),

              const SizedBox(height: 18),

              _InfoRow(
                icon: Icons.calendar_today_outlined,
                label: 'stores.details.created_at'.tr(),
                value: _formatDate(store.createdAt),
              ),

              const SizedBox(height: 18),

              _InfoRow(
                icon: Icons.update_outlined,
                label: 'stores.details.updated_at'.tr(),
                value: _formatDate(store.updatedAt),
              ),

              const SizedBox(height: 28),

              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('common.close'.tr()),
                ),
              ),
            ],
          ),
        ),
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

  String _valueOrDash(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '—';
    }

    return value;
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colors.primary.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 20, color: colors.primary),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              SelectableText(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
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

    final isActive = status.toLowerCase() == 'active';

    final foreground = isActive ? dashboardColors.success : colors.error;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: foreground.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'stores.status.active'.tr() : 'stores.status.inactive'.tr(),
        style: theme.textTheme.bodySmall?.copyWith(
          color: foreground,
          fontWeight: FontWeight.w600,
        ),
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
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 72,
        height: 72,
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
                      width: 20,
                      height: 20,
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
      size: 30,
      color: colors.onSurfaceVariant,
    );
  }
}
