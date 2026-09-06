import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/suppliers/domain/repos/suppliers_repository.dart';

import 'suppliers_state.dart';

class SuppliersCubit extends Cubit<SuppliersState> {
  static const int _perPage = 15;

  final SuppliersRepository repository;

  int _currentPage = 1;

  String? _search;
  String? _status;
  SuppliersCubit(this.repository)
    : super(const SuppliersInitial());

  int get currentPage => _currentPage;

  Future<void> filterByStatus(String? status) async {
    _status = _normalizeValue(status);
    _currentPage = 1;

    await _loadSuppliers();
  }

  Future<void> getSuppliers({
    String? search,
    String? status,
    int page = 1,
  }) async {
    _search = _normalizeSearch(search);
    _status = _normalizeValue(status);
    _currentPage = page;

    await _loadSuppliers();
  }

  Future<void> goToPage(int page) async {
    final currentState = state;

    if (currentState is! SuppliersSuccess) {
      return;
    }

    if (page < 1 ||
        page > currentState.lastPage ||
        page == currentState.currentPage) {
      return;
    }

    _currentPage = page;

    await _loadSuppliers();
  }

  Future<void> nextPage() async {
    final currentState = state;

    if (currentState is! SuppliersSuccess ||
        !currentState.hasNextPage) {
      return;
    }

    _currentPage = currentState.currentPage + 1;

    await _loadSuppliers();
  }

  Future<void> previousPage() async {
    final currentState = state;

    if (currentState is! SuppliersSuccess ||
        !currentState.hasPreviousPage) {
      return;
    }

    _currentPage = currentState.currentPage - 1;

    await _loadSuppliers();
  }

  Future<void> refreshAfterDelete() async {
    final currentState = state;

    if (currentState is SuppliersSuccess &&
        currentState.suppliers.length == 1 &&
        currentState.currentPage > 1) {
      _currentPage = currentState.currentPage - 1;
    }

    await _loadSuppliers();
  }

  Future<void> refreshCurrentPage() async {
    await _loadSuppliers();
  }

  Future<void> searchSuppliers(String value) async {
    _search = _normalizeSearch(value);
    _currentPage = 1;

    await _loadSuppliers();
  }

  Future<void> _loadSuppliers() async {
    emit(const SuppliersLoading());

    final result = await repository.getSuppliers(
      search: _search,
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
            const SuppliersSuccess(
              suppliers: [],
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
          SuppliersSuccess(
            suppliers: pagination.suppliers,
            currentPage: pagination.currentPage,
            lastPage: pagination.lastPage,
            perPage: pagination.perPage,
            total: pagination.total,
          ),
        );
      },
      failure: (error) {
        emit(
          SuppliersFailure(
            error.message ?? 'Something went wrong',
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

  String? _normalizeValue(String? value) {
    final trimmed = value?.trim();

    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }

    return trimmed;
  }
}
