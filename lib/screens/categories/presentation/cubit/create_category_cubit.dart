import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/categories/data/models/create_category_request.dart';
import 'package:dashboard/screens/categories/domain/repos/categories_repository.dart';
import 'package:dashboard/screens/categories/presentation/cubit/category_action_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateCategoryCubit extends Cubit<CategoryActionState> {
  final CategoriesRepository repository;

  CreateCategoryCubit(this.repository) : super(const CategoryActionInitial());

  Future<void> createCategory({
    required String name,
    required String color,
  }) async {
    emit(const CategoryActionLoading());

    final result = await repository.createCategory(
      CreateCategoryRequest(name: name, color: color),
    );

    switch (result) {
      case Success():
        emit(const CategoryActionSuccess('Category created successfully.'));

      case Failure(error: final error):
        emit(
          CategoryActionFailure(error.message ?? 'Failed to create category.'),
        );
    }
  }
}
