import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String title;

  const CategoryChip({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        title,
        style: theme.textTheme.bodySmall?.copyWith(
          fontSize: 11,
          color: colors.onPrimaryContainer,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
