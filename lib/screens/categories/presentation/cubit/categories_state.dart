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

  const CategoriesSuccess(this.categories);
}
