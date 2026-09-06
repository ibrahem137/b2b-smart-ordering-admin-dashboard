import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/categories/domain/repos/categories_repository.dart';

import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  static const int _perPage = 15;

  final CategoriesRepository repository;

  int _currentPage = 1;

  String? _search;
  CategoriesCubit(this.repository)
    : super(const CategoriesInitial());

  int get currentPage => _currentPage;

  Future<void> getCategories({
    String? search,
    int page = 1,
  }) async {
    _search = _normalizeSearch(search);
    _currentPage = page;

    await _loadCategories();
  }

  Future<void> goToPage(int page) async {
    final currentState = state;

    if (currentState is! CategoriesSuccess) {
      return;
    }

    if (page < 1 ||
        page > currentState.lastPage ||
        page == currentState.currentPage) {
      return;
    }

    _currentPage = page;

    await _loadCategories();
  }

  Future<void> nextPage() async {
    final currentState = state;

    if (currentState is! CategoriesSuccess ||
        !currentState.hasNextPage) {
      return;
    }

    _currentPage = currentState.currentPage + 1;

    await _loadCategories();
  }

  Future<void> previousPage() async {
    final currentState = state;

    if (currentState is! CategoriesSuccess ||
        !currentState.hasPreviousPage) {
      return;
    }

    _currentPage = currentState.currentPage - 1;

    await _loadCategories();
  }

  Future<void> refreshAfterDelete() async {
    final currentState = state;

    if (currentState is CategoriesSuccess &&
        currentState.categories.length == 1 &&
        currentState.currentPage > 1) {
      _currentPage = currentState.currentPage - 1;
    }

    await _loadCategories();
  }

  Future<void> refreshCurrentPage() async {
    await _loadCategories();
  }

  Future<void> searchCategories(String value) async {
    _search = _normalizeSearch(value);
    _currentPage = 1;

    await _loadCategories();
  }

  Future<void> _loadCategories() async {
    emit(const CategoriesLoading());

    final result = await repository.getCategories(
      search: _search,
      page: _currentPage,
      perPage: _perPage,
    );

    result.when(
      success: (response) {
        final pagination = response.data;

        if (pagination == null) {
          _currentPage = 1;

          emit(
            const CategoriesSuccess(
              categories: [],
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
          CategoriesSuccess(
            categories: pagination.categories,
            currentPage: pagination.currentPage,
            lastPage: pagination.lastPage,
            perPage: pagination.perPage,
            total: pagination.total,
          ),
        );
      },
      failure: (error) {
        emit(
          CategoriesFailure(
            error.message ?? 'Failed to load categories',
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
