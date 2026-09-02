import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/suppliers/domain/repos/suppliers_repository.dart';

class SupplierCategoriesCubit extends Cubit<SupplierCategoriesState> {
  final SuppliersRepository repository;

  SupplierCategoriesCubit(this.repository)
    : super(const SupplierCategoriesInitial());

  Future<void> getSupplierCategories(int supplierId) async {
    emit(const SupplierCategoriesLoading());

    final result = await repository.getSupplierCategoryIds(supplierId);

    result.when(
      success: (ids) {
        emit(SupplierCategoriesSuccess(ids));
      },
      failure: (error) {
        emit(
          SupplierCategoriesFailure(
            error.message ?? 'Failed to load supplier categories',
          ),
        );
      },
    );
  }
}

class SupplierCategoriesFailure extends SupplierCategoriesState {
  final String message;

  const SupplierCategoriesFailure(this.message);
}

class SupplierCategoriesInitial extends SupplierCategoriesState {
  const SupplierCategoriesInitial();
}

class SupplierCategoriesLoading extends SupplierCategoriesState {
  const SupplierCategoriesLoading();
}

sealed class SupplierCategoriesState {
  const SupplierCategoriesState();
}

class SupplierCategoriesSuccess extends SupplierCategoriesState {
  final List<int> categoryIds;

  const SupplierCategoriesSuccess(this.categoryIds);
}
