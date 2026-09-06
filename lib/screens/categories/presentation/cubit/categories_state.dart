import 'package:dashboard/screens/categories/data/models/category_model.dart';

class CategoriesFailure extends CategoriesState {
  final String message;

  const CategoriesFailure(this.message);
}

class CategoriesInitial extends CategoriesState {
  const CategoriesInitial();
}

class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

sealed class CategoriesState {
  const CategoriesState();
}

class CategoriesSuccess extends CategoriesState {
  final List<CategoryModel> categories;

  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const CategoriesSuccess({
    required this.categories,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  int get from {
    if (categories.isEmpty) {
      return 0;
    }

    return ((currentPage - 1) * perPage) + 1;
  }

  bool get hasNextPage => currentPage < lastPage;

  bool get hasPreviousPage => currentPage > 1;

  int get to {
    if (categories.isEmpty) {
      return 0;
    }

    final value = from + categories.length - 1;

    return value > total ? total : value;
  }
}
