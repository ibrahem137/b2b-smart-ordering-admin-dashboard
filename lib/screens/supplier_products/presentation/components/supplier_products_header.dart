import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SupplierProductsHeader extends StatelessWidget {
  final VoidCallback? onAddOffer;

  const SupplierProductsHeader({
    super.key,
    this.onAddOffer,
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
                'supplier_products.title'.tr(),
                style: theme.textTheme.headlineSmall
                    ?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),

              const SizedBox(height: 4),

              Text(
                'supplier_products.subtitle'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        FilledButton.icon(
          onPressed: onAddOffer,
          icon: const Icon(Icons.add, size: 18),
          label: Text('supplier_products.add_offer'.tr()),
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
