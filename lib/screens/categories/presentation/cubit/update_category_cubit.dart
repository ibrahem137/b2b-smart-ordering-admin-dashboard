import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/categories/data/models/update_category_request.dart';
import 'package:dashboard/screens/categories/domain/repos/categories_repository.dart';
import 'package:dashboard/screens/categories/presentation/cubit/category_action_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCategoryCubit extends Cubit<CategoryActionState> {
  final CategoriesRepository repository;

  UpdateCategoryCubit(this.repository) : super(const CategoryActionInitial());

  Future<void> updateCategory({
    required int id,
    String? name,
    String? color,
  }) async {
    emit(const CategoryActionLoading());

    final result = await repository.updateCategory(
      UpdateCategoryRequest(id: id, name: name, color: color),
    );

    switch (result) {
      case Success():
        emit(const CategoryActionSuccess('Category updated successfully.'));

      case Failure(error: final error):
        emit(
          CategoryActionFailure(error.message ?? 'Failed to update category.'),
        );
    }
  }
}
