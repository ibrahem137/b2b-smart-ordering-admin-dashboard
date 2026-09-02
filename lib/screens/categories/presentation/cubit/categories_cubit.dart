import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/categories/domain/repos/categories_repository.dart';

import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository repository;

  CategoriesCubit(this.repository) : super(const CategoriesInitial());

  Future<void> getCategories({String? search}) async {
    emit(const CategoriesLoading());

    final result = await repository.getCategories(search: search);

    result.when(
      success: (response) {
        emit(CategoriesSuccess(response.data?.categories ?? []));
      },
      failure: (error) {
        emit(CategoriesFailure(error.message ?? 'Failed to load categories'));
      },
    );
  }
}
