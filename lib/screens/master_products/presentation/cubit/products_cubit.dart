import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/master_products/domain/repos/products_repository.dart';

import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  static const int _perPage = 15;

  final ProductsRepository repository;

  int _currentPage = 1;

  int? _supplierId;

  int? _categoryId;
  String? _status;
  String? _search;
  ProductsCubit(this.repository)
    : super(const ProductsInitial());

  int get currentPage => _currentPage;

  Future<void> getProducts({
    int? supplierId,
    int? categoryId,
    String? status,
    String? search,
    int page = 1,
  }) async {
    _supplierId = supplierId;
    _categoryId = categoryId;
    _status = status;
    _search = _normalizeSearch(search);
    _currentPage = page;

    await _loadProducts();
  }

  Future<void> goToPage(int page) async {
    final currentState = state;

    if (currentState is! ProductsSuccess) {
      return;
    }

    if (page < 1 || page > currentState.lastPage) {
      return;
    }

    if (page == currentState.currentPage) {
      return;
    }

    _currentPage = page;

    await _loadProducts();
  }

  Future<void> nextPage() async {
    final currentState = state;

    if (currentState is! ProductsSuccess) {
      return;
    }

    if (!currentState.hasNextPage) {
      return;
    }

    _currentPage = currentState.currentPage + 1;

    await _loadProducts();
  }

  Future<void> previousPage() async {
    final currentState = state;

    if (currentState is! ProductsSuccess) {
      return;
    }

    if (!currentState.hasPreviousPage) {
      return;
    }

    _currentPage = currentState.currentPage - 1;

    await _loadProducts();
  }

  Future<void> refreshAfterDelete() async {
    final currentState = state;

    if (currentState is ProductsSuccess &&
        currentState.products.length == 1 &&
        currentState.currentPage > 1) {
      _currentPage = currentState.currentPage - 1;
    }

    await _loadProducts();
  }

  Future<void> refreshCurrentPage() async {
    await _loadProducts();
  }

  Future<void> searchProducts(String value) async {
    _search = _normalizeSearch(value);
    _currentPage = 1;

    await _loadProducts();
  }

  Future<void> _loadProducts() async {
    emit(const ProductsLoading());

    final result = await repository.getProducts(
      supplierId: _supplierId,
      categoryId: _categoryId,
      status: _status,
      search: _search,
      page: _currentPage,
      perPage: _perPage,
    );

    result.when(
      success: (response) {
        final pagination = response.data;

        if (pagination == null) {
          emit(
            const ProductsSuccess(
              products: [],
              currentPage: 1,
              lastPage: 1,
              perPage: _perPage,
              total: 0,
            ),
          );
          return;
        }

        _currentPage = pagination.currentPage;

        emit(
          ProductsSuccess(
            products: pagination.products,
            currentPage: pagination.currentPage,
            lastPage: pagination.lastPage,
            perPage: pagination.perPage,
            total: pagination.total,
          ),
        );
      },
      failure: (error) {
        emit(
          ProductsFailure(
            error.message ?? 'Failed to load products',
          ),
        );
      },
    );
  }

  String? _normalizeSearch(String? value) {
    final trimmed = value?.trim();

    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }

    return trimmed;
  }
}
