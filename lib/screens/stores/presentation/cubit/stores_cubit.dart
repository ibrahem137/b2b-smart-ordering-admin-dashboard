import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/stores/domain/repos/stores_repository.dart';
import 'package:dashboard/screens/stores/presentation/cubit/stores_state.dart';

class StoresCubit extends Cubit<StoresState> {
  static const int _perPage = 15;

  final StoresRepository repository;

  String? _status;

  String? _search;
  int _currentPage = 1;
  StoresCubit(this.repository)
    : super(const StoresState.initial());

  int get currentPage => _currentPage;

  Future<void> filterByStatus(String? status) async {
    _status = _normalize(status);
    _currentPage = 1;

    await _loadStores();
  }

  Future<void> getStores({
    String? status,
    String? search,
    int page = 1,
  }) async {
    _status = _normalize(status);
    _search = _normalize(search);
    _currentPage = page;

    await _loadStores();
  }

  Future<void> goToPage(int page) async {
    final currentState = state;

    if (currentState is! StoresSuccess) {
      return;
    }

    if (page < 1 ||
        page > currentState.lastPage ||
        page == currentState.currentPage) {
      return;
    }

    _currentPage = page;

    await _loadStores();
  }

  Future<void> nextPage() async {
    final currentState = state;

    if (currentState is! StoresSuccess ||
        currentState.currentPage >= currentState.lastPage) {
      return;
    }

    _currentPage = currentState.currentPage + 1;

    await _loadStores();
  }

  Future<void> previousPage() async {
    final currentState = state;

    if (currentState is! StoresSuccess ||
        currentState.currentPage <= 1) {
      return;
    }

    _currentPage = currentState.currentPage - 1;

    await _loadStores();
  }

  Future<void> refreshAfterDelete() async {
    final currentState = state;

    if (currentState is StoresSuccess &&
        currentState.stores.length == 1 &&
        currentState.currentPage > 1) {
      _currentPage = currentState.currentPage - 1;
    }

    await _loadStores();
  }

  Future<void> refreshCurrentPage() async {
    await _loadStores();
  }

  Future<void> searchStores(String? search) async {
    _search = _normalize(search);
    _currentPage = 1;

    await _loadStores();
  }

  Future<void> _loadStores() async {
    emit(const StoresState.loading());

    final result = await repository.getStores(
      status: _status,
      search: _search,
      page: _currentPage,
      perPage: _perPage,
    );

    result.when(
      success: (response) {
        final pagination = response.data;

        _currentPage = pagination.currentPage;

        emit(
          StoresState.success(
            stores: pagination.stores,
            currentPage: pagination.currentPage,
            lastPage: pagination.lastPage,
            perPage: pagination.perPage,
            total: pagination.total,
          ),
        );
      },
      failure: (error) {
        emit(
          StoresState.failure(
            error.message ?? 'Failed to load stores',
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
