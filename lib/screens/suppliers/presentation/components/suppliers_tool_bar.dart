import 'package:dashboard/core/theme/extensions.dart';
import 'package:dashboard/screens/suppliers/presentation/components/status_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SuppliersToolbar extends StatelessWidget {
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final int activeSuppliers;
  final int inactiveSuppliers;

  const SuppliersToolbar({
    super.key,
    this.searchController,
    this.onSearchChanged,
    required this.activeSuppliers,
    required this.inactiveSuppliers,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dashboardColors = theme
        .extension<DashboardColors>()!;

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            width: 320,
            child: TextField(
              controller: searchController,
              onChanged: onSearchChanged,
              decoration: InputDecoration(
                hintText: 'suppliers.search_hint'.tr(),
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
        StatusCard(
          title: 'suppliers.active'.tr(),
          value: activeSuppliers,
          backgroundColor: dashboardColors.success
              .withValues(alpha: .10),
          textColor: dashboardColors.success,
        ),
        const SizedBox(width: 12),
        StatusCard(
          title: 'suppliers.inactive'.tr(),
          value: inactiveSuppliers,
          backgroundColor: colors.surfaceContainerHighest,
          textColor: colors.onSurfaceVariant,
        ),
      ],
    );
  }
}
