import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/sales/domain/repos/sales_repository.dart';

import 'sales_state.dart';

class SalesCubit extends Cubit<SalesState> {
  static const int _perPage = 15;

  final SalesRepository repository;

  int _currentPage = 1;

  int? _storeId;

  int? _customerId;
  String? _status;
  String? _fromDate;
  String? _toDate;
  SalesCubit(this.repository) : super(const SalesInitial());

  int get currentPage => _currentPage;

  Future<void> filterByCustomer(int? customerId) async {
    _customerId = customerId;
    _currentPage = 1;

    await _loadSales();
  }

  Future<void> filterByDateRange({
    String? fromDate,
    String? toDate,
  }) async {
    _fromDate = _normalize(fromDate);
    _toDate = _normalize(toDate);
    _currentPage = 1;

    await _loadSales();
  }

  Future<void> filterByStatus(String? status) async {
    _status = _normalize(status);
    _currentPage = 1;

    await _loadSales();
  }

  Future<void> filterByStore(int? storeId) async {
    _storeId = storeId;
    _currentPage = 1;

    await _loadSales();
  }

  Future<void> getSales({
    int? storeId,
    int? customerId,
    String? status,
    String? fromDate,
    String? toDate,
    int page = 1,
  }) async {
    _storeId = storeId;
    _customerId = customerId;
    _status = _normalize(status);
    _fromDate = _normalize(fromDate);
    _toDate = _normalize(toDate);
    _currentPage = page;

    await _loadSales();
  }

  Future<void> goToPage(int page) async {
    final currentState = state;

    if (currentState is! SalesSuccess) {
      return;
    }

    if (page < 1 ||
        page > currentState.lastPage ||
        page == currentState.currentPage) {
      return;
    }

    _currentPage = page;

    await _loadSales();
  }

  Future<void> nextPage() async {
    final currentState = state;

    if (currentState is! SalesSuccess ||
        !currentState.hasNextPage) {
      return;
    }

    _currentPage = currentState.currentPage + 1;

    await _loadSales();
  }

  Future<void> previousPage() async {
    final currentState = state;

    if (currentState is! SalesSuccess ||
        !currentState.hasPreviousPage) {
      return;
    }

    _currentPage = currentState.currentPage - 1;

    await _loadSales();
  }

  Future<void> refreshCurrentPage() async {
    await _loadSales();
  }

  Future<void> _loadSales() async {
    emit(const SalesLoading());

    final result = await repository.getSales(
      storeId: _storeId,
      customerId: _customerId,
      status: _status,
      fromDate: _fromDate,
      toDate: _toDate,
      page: _currentPage,
      perPage: _perPage,
    );

    result.when(
      success: (response) {
        final pagination = response.data;

        if (pagination == null) {
          _currentPage = 1;

          emit(
            const SalesSuccess(
              sales: [],
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
          SalesSuccess(
            sales: pagination.sales,
            currentPage: pagination.currentPage,
            lastPage: pagination.lastPage,
            perPage: pagination.perPage,
            total: pagination.total,
          ),
        );
      },
      failure: (error) {
        emit(
          SalesFailure(
            error.message ?? 'Failed to load sales',
          ),
        );
      },
    );
  }

  String? _normalize(String? value) {
    final trimmed = value?.trim();

    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }

    return trimmed;
  }
}
