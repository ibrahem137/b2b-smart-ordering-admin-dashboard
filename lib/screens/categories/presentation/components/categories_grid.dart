import 'package:dashboard/screens/categories/data/models/category_model.dart';
import 'package:dashboard/screens/categories/presentation/components/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesGrid extends StatelessWidget {
  final List<CategoryModel> categories;
  final void Function(CategoryModel category)? onEdit;
  final void Function(CategoryModel category)? onDelete;

  const CategoriesGrid({
    super.key,
    required this.categories,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _getCrossAxisCount(
          constraints.maxWidth,
        );

        return GridView.builder(
          itemCount: categories.length,
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                mainAxisExtent: _getCardHeight(
                  constraints.maxWidth,
                ),
              ),
          itemBuilder: (context, index) {
            final category = categories[index];

            return CategoryCard(
              category: category,
              onEdit: () {
                onEdit?.call(category);
              },
              onDelete: () {
                onDelete?.call(category);
              },
            );
          },
        );
      },
    );
  }

  double _getCardHeight(double width) {
    if (width >= 1400) {
      return 300;
    }

    if (width >= 1000) {
      return 300;
    }

    if (width >= 650) {
      return 310;
    }

    return 320;
  }

  int _getCrossAxisCount(double width) {
    if (width >= 1400) {
      return 4;
    }

    if (width >= 1000) {
      return 3;
    }

    if (width >= 650) {
      return 2;
    }

    return 1;
  }
}
