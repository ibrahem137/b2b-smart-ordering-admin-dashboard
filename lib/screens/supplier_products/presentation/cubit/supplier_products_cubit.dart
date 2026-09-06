import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/supplier_products/domain/repos/supplier_products_repository.dart';

import 'supplier_products_state.dart';

class SupplierProductsCubit
    extends Cubit<SupplierProductsState> {
  static const int _perPage = 15;

  final SupplierProductsRepository repository;

  int _currentPage = 1;

  int? _supplierId;

  int? _productId;
  String? _status;
  SupplierProductsCubit(this.repository)
    : super(const SupplierProductsInitial());

  int get currentPage => _currentPage;

  Future<void> filterByProduct(int? productId) async {
    _productId = productId;
    _currentPage = 1;

    await _loadSupplierProducts();
  }

  Future<void> filterByStatus(String? status) async {
    _status = _normalizeStatus(status);
    _currentPage = 1;

    await _loadSupplierProducts();
  }

  Future<void> filterBySupplier(int? supplierId) async {
    _supplierId = supplierId;
    _currentPage = 1;

    await _loadSupplierProducts();
  }

  Future<void> getSupplierProducts({
    int? supplierId,
    int? productId,
    String? status,
    int page = 1,
  }) async {
    _supplierId = supplierId;
    _productId = productId;
    _status = _normalizeStatus(status);
    _currentPage = page;

    await _loadSupplierProducts();
  }

  Future<void> goToPage(int page) async {
    final currentState = state;

    if (currentState is! SupplierProductsSuccess) {
      return;
    }

    if (page < 1 ||
        page > currentState.lastPage ||
        page == currentState.currentPage) {
      return;
    }

    _currentPage = page;

    await _loadSupplierProducts();
  }

  Future<void> nextPage() async {
    final currentState = state;

    if (currentState is! SupplierProductsSuccess ||
        !currentState.hasNextPage) {
      return;
    }

    _currentPage = currentState.currentPage + 1;

    await _loadSupplierProducts();
  }

  Future<void> previousPage() async {
    final currentState = state;

    if (currentState is! SupplierProductsSuccess ||
        !currentState.hasPreviousPage) {
      return;
    }

    _currentPage = currentState.currentPage - 1;

    await _loadSupplierProducts();
  }

  Future<void> refreshAfterDelete() async {
    final currentState = state;

    if (currentState is SupplierProductsSuccess &&
        currentState.supplierProducts.length == 1 &&
        currentState.currentPage > 1) {
      _currentPage = currentState.currentPage - 1;
    }

    await _loadSupplierProducts();
  }

  Future<void> refreshCurrentPage() async {
    await _loadSupplierProducts();
  }

  Future<void> _loadSupplierProducts() async {
    emit(const SupplierProductsLoading());

    final result = await repository.getSupplierProducts(
      supplierId: _supplierId,
      productId: _productId,
      status: _status,
      page: _currentPage,
      perPage: _perPage,
    );

    result.when(
      success: (response) {
        final pagination = response.data;

        if (pagination == null) {
          _currentPage = 1;

          emit(
            const SupplierProductsSuccess(
              supplierProducts: [],
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
          SupplierProductsSuccess(
            supplierProducts: pagination.supplierProducts,
            currentPage: pagination.currentPage,
            lastPage: pagination.lastPage,
            perPage: pagination.perPage,
            total: pagination.total,
          ),
        );
      },
      failure: (error) {
        emit(
          SupplierProductsFailure(
            error.message ??
                'Failed to load supplier products',
          ),
        );
      },
    );
  }

  String? _normalizeStatus(String? value) {
    final trimmed = value?.trim();

    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }

    return trimmed;
  }
}
