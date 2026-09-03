import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MasterProductsHeader extends StatelessWidget {
  final VoidCallback? onAddProduct;

  const MasterProductsHeader({
    super.key,
    this.onAddProduct,
  });

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
                'master_products.title'.tr(),
                style: theme.textTheme.headlineSmall
                    ?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'master_products.subtitle'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        FilledButton.icon(
          onPressed: onAddProduct,
          icon: const Icon(Icons.add, size: 18),
          label: Text('master_products.add_product'.tr()),
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
