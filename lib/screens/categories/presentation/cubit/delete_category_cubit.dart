import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/categories/domain/repos/categories_repository.dart';
import 'package:dashboard/screens/categories/presentation/cubit/category_action_state.dart';

class DeleteCategoryCubit extends Cubit<CategoryActionState> {
  final CategoriesRepository repository;

  DeleteCategoryCubit(this.repository) : super(const CategoryActionInitial());

  Future<void> deleteCategory(int id) async {
    emit(const CategoryActionLoading());

    final result = await repository.deleteCategory(id);

    result.when(
      success: (_) {
        emit(const CategoryActionSuccess('Category deleted successfully'));
      },
      failure: (error) {
        emit(
          CategoryActionFailure(error.message ?? 'Failed to delete category'),
        );
      },
    );
  }
}
