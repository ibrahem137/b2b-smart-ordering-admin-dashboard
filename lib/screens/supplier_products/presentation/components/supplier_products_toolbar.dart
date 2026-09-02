import 'package:flutter/material.dart';

class SupplierProductsToolbar extends StatelessWidget {
  final ValueChanged<String>? onSearch;
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const SupplierProductsToolbar({
    super.key,
    this.onSearch,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    const filters = ['All', 'Available', 'Unavailable', 'Archived'];

    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onSearch,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colors.onSurface,
            ),
            decoration: InputDecoration(
              hintText: 'Search product or supplier...',
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
              prefixIcon: Icon(Icons.search, color: colors.onSurfaceVariant),
              filled: true,
              fillColor: colors.surface,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colors.outlineVariant),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colors.outlineVariant),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: colors.primary, width: 1.5),
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
              label: Text(filter),
              selected: selected,
              onSelected: (_) {
                onFilterChanged(filter);
              },
              showCheckmark: false,
              selectedColor: colors.primary,
              backgroundColor: colors.surfaceContainerHighest,
              side: BorderSide.none,
              labelStyle: theme.textTheme.bodyMedium?.copyWith(
                color: selected ? colors.onPrimary : colors.onSurfaceVariant,
                fontWeight: FontWeight.w600,
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
}
