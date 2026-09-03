import 'package:dashboard/screens/categories/data/models/category_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const CategoryCard({
    super.key,
    required this.category,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final categoryColor = _parseColor(
      category.color,
      fallback: colors.primary,
    );

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 140,
            width: double.infinity,
            child: Container(
              color: categoryColor,
              child: Center(
                child: Icon(
                  Icons.category_outlined,
                  size: 48,
                  color: _foregroundColor(categoryColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(
                          color: colors.onSurface,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'ID: ${category.id}',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(
                          color: colors.onSurfaceVariant,
                          fontSize: 12,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: categoryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: colors.outlineVariant,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _normalizeHex(category.color),
                        style: theme.textTheme.bodySmall
                            ?.copyWith(
                              color:
                                  colors.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Divider(
                    color: colors.outlineVariant,
                    height: 1,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end,
                    children: [
                      IconButton(
                        tooltip: 'common.edit'.tr(),
                        onPressed: onEdit,
                        icon: Icon(
                          Icons.edit_outlined,
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      IconButton(
                        tooltip: 'common.delete'.tr(),
                        onPressed: onDelete,
                        icon: Icon(
                          Icons.delete_outline,
                          color: colors.error,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _foregroundColor(Color background) {
    return background.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;
  }

  String _normalizeHex(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'categories.default_color'.tr();
    }

    final hex = value.trim();

    if (hex.startsWith('#')) {
      return hex.toUpperCase();
    }

    return '#${hex.toUpperCase()}';
  }

  Color _parseColor(
    String? value, {
    required Color fallback,
  }) {
    if (value == null || value.trim().isEmpty) {
      return fallback;
    }

    var hex = value.trim().replaceAll('#', '');

    if (hex.length == 6) {
      hex = 'FF$hex';
    }

    final parsed = int.tryParse(hex, radix: 16);

    if (parsed == null) {
      return fallback;
    }

    return Color(parsed);
  }
}
