import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoriesHeader extends StatelessWidget {
  final VoidCallback? onAddCategory;

  const CategoriesHeader({super.key, this.onAddCategory});

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
                'categories.title'.tr(),
                style: theme.textTheme.headlineSmall
                    ?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'categories.subtitle'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        FilledButton.icon(
          onPressed: onAddCategory,
          icon: const Icon(Icons.add, size: 18),
          label: Text('categories.add_category'.tr()),
          style: FilledButton.styleFrom(
            backgroundColor: colors.primary,
            foregroundColor: colors.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 18,
            ),
          ),
        ),
      ],
    );
  }
}
