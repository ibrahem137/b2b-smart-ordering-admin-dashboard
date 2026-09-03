import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SuppliersHeader extends StatelessWidget {
  final VoidCallback? onAddSupplier;

  const SuppliersHeader({super.key, this.onAddSupplier});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'suppliers.title'.tr(),
                style: theme.textTheme.headlineSmall
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.onSurface,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'suppliers.subtitle'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        FilledButton.icon(
          onPressed: onAddSupplier,
          icon: const Icon(Icons.add, size: 18),
          label: Text('suppliers.add_supplier'.tr()),
          style: FilledButton.styleFrom(
            backgroundColor: colors.primary,
            foregroundColor: colors.onPrimary,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 18,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
