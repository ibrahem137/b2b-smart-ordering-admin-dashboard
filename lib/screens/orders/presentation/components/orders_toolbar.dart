import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrdersToolbar extends StatelessWidget {
  final ValueChanged<String>? onSearch;

  final String selectedFilter;

  final ValueChanged<String> onFilterChanged;

  const OrdersToolbar({
    super.key,
    this.onSearch,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    const filters = ['all', 'draft', 'submitted', 'received', 'cancelled'];

    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onSearch,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurface,
            ),
            decoration: InputDecoration(
              hintText: 'orders.search_orders'.tr(),
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
              prefixIcon: Icon(Icons.search, color: colors.onSurfaceVariant),
              filled: true,
              fillColor: colors.surface,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colors.outlineVariant),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colors.primary, width: 1.5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colors.outlineVariant),
              ),
            ),
          ),
        ),

        const SizedBox(width: 24),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: filters.map((filter) {
            final selected = selectedFilter == filter;

            return ChoiceChip(
              label: Text(_filterLabel(filter)),
              selected: selected,
              onSelected: (_) {
                onFilterChanged(filter);
              },
              showCheckmark: false,
              side: BorderSide(
                color: selected ? colors.primary : colors.outlineVariant,
              ),
              backgroundColor: colors.surfaceContainerHighest,
              selectedColor: colors.primary,
              labelStyle: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: selected ? colors.onPrimary : colors.onSurfaceVariant,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _filterLabel(String filter) {
    switch (filter) {
      case 'all':
        return 'common.all'.tr();

      case 'draft':
        return 'orders.draft'.tr();

      case 'submitted':
        return 'orders.submitted'.tr();

      case 'received':
        return 'orders.received'.tr();

      case 'cancelled':
        return 'orders.cancelled'.tr();

      default:
        return filter;
    }
  }
}
