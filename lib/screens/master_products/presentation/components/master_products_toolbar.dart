import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MasterProductsToolbar extends StatelessWidget {
  final ValueChanged<String>? onSearch;
  final int totalProducts;

  const MasterProductsToolbar({
    super.key,
    this.onSearch,
    required this.totalProducts,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: 320,
            child: TextField(
              onChanged: onSearch,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
              ),
              decoration: InputDecoration(
                hintText: 'master_products.search_products'
                    .tr(),
                hintStyle: theme.textTheme.bodyMedium
                    ?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                prefixIcon: Icon(
                  Icons.search,
                  color: colors.onSurfaceVariant,
                ),
                filled: true,
                fillColor: colors.surface,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: colors.outlineVariant,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: colors.outlineVariant,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: colors.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: colors.primaryContainer,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colors.outlineVariant,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'master_products.total'.tr(),
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  color: colors.onPrimaryContainer
                      .withValues(alpha: 0.70),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'master_products.products_count'.tr(
                  args: [totalProducts.toString()],
                ),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: colors.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
