import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SalesHeader extends StatelessWidget {
  const SalesHeader({super.key});

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
                'sales.title'.tr(),
                style: theme.textTheme.headlineSmall
                    ?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'sales.subtitle'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
