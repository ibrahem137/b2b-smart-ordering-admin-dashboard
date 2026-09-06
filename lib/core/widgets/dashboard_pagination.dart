import 'package:flutter/material.dart';

class DashboardPagination extends StatelessWidget {
  final int currentPage;
  final int lastPage;
  final int from;
  final int to;
  final int total;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  const DashboardPagination({
    super.key,
    required this.currentPage,
    required this.lastPage,
    required this.from,
    required this.to,
    required this.total,
    this.onPrevious,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(
          top: BorderSide(color: colors.outlineVariant),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            tooltip: 'Previous',
            onPressed: currentPage > 1 ? onPrevious : null,
            icon: const Icon(Icons.chevron_left),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$currentPage / $lastPage',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            tooltip: 'Next',
            onPressed: currentPage < lastPage
                ? onNext
                : null,
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
