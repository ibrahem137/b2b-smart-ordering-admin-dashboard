import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/orders/domain/repos/orders_repository.dart';

import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  static const int _perPage = 15;

  final OrdersRepository repository;

  int _currentPage = 1;

  int? _storeId;

  int? _supplierId;
  String? _status;
  String? _fromDate;
  String? _toDate;
  OrdersCubit(this.repository)
    : super(const OrdersInitial());

  int get currentPage => _currentPage;

  Future<void> filterByDateRange({
    String? fromDate,
    String? toDate,
  }) async {
    _fromDate = _normalize(fromDate);
    _toDate = _normalize(toDate);
    _currentPage = 1;

    await _loadOrders();
  }

  Future<void> filterByStatus(String? status) async {
    _status = _normalize(status);
    _currentPage = 1;

    await _loadOrders();
  }

  Future<void> filterByStore(int? storeId) async {
    _storeId = storeId;
    _currentPage = 1;

    await _loadOrders();
  }

  Future<void> filterBySupplier(int? supplierId) async {
    _supplierId = supplierId;
    _currentPage = 1;

    await _loadOrders();
  }

  Future<void> getOrders({
    int? storeId,
    int? supplierId,
    String? status,
    String? fromDate,
    String? toDate,
    int page = 1,
  }) async {
    _storeId = storeId;
    _supplierId = supplierId;
    _status = _normalize(status);
    _fromDate = _normalize(fromDate);
    _toDate = _normalize(toDate);
    _currentPage = page;

    await _loadOrders();
  }

  Future<void> goToPage(int page) async {
    final currentState = state;

    if (currentState is! OrdersSuccess) {
      return;
    }

    if (page < 1 ||
        page > currentState.lastPage ||
        page == currentState.currentPage) {
      return;
    }

    _currentPage = page;

    await _loadOrders();
  }

  Future<void> nextPage() async {
    final currentState = state;

    if (currentState is! OrdersSuccess ||
        !currentState.hasNextPage) {
      return;
    }

    _currentPage = currentState.currentPage + 1;

    await _loadOrders();
  }

  Future<void> previousPage() async {
    final currentState = state;

    if (currentState is! OrdersSuccess ||
        !currentState.hasPreviousPage) {
      return;
    }

    _currentPage = currentState.currentPage - 1;

    await _loadOrders();
  }

  Future<void> refreshCurrentPage() async {
    await _loadOrders();
  }

  Future<void> _loadOrders() async {
    emit(const OrdersLoading());

    final result = await repository.getOrders(
      storeId: _storeId,
      supplierId: _supplierId,
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
            const OrdersSuccess(
              orders: [],
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
          OrdersSuccess(
            orders: pagination.orders,
            currentPage: pagination.currentPage,
            lastPage: pagination.lastPage,
            perPage: pagination.perPage,
            total: pagination.total,
          ),
        );
      },
      failure: (error) {
        emit(
          OrdersFailure(
            error.message ?? 'Failed to load orders',
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
