import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SupplierOffersHeader extends StatelessWidget {
  final VoidCallback onAddOffer;

  const SupplierOffersHeader({super.key, required this.onAddOffer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'supplier_offers.title'.tr(),
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'supplier_offers.subtitle'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        FilledButton.icon(
          onPressed: onAddOffer,
          icon: const Icon(Icons.add),
          label: Text('supplier_offers.add_offer'.tr()),
        ),
      ],
    );
  }
}
