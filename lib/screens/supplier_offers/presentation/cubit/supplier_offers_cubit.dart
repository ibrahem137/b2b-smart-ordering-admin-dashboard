import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/supplier_offers/domain/repos/supplier_offers_repository.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/supplier_offers_state.dart';

class SupplierOffersCubit
    extends Cubit<SupplierOffersState> {
  static const int _perPage = 15;

  final SupplierOffersRepository repository;

  int _currentPage = 1;

  int? _supplierProductId;
  String? _status;
  SupplierOffersCubit(this.repository)
    : super(const SupplierOffersState.initial());

  int get currentPage => _currentPage;

  Future<void> filterByStatus(String? status) async {
    _status = _normalizeStatus(status);
    _currentPage = 1;

    await _loadSupplierOffers();
  }

  Future<void> filterBySupplierProduct(
    int? supplierProductId,
  ) async {
    _supplierProductId = supplierProductId;
    _currentPage = 1;

    await _loadSupplierOffers();
  }

  Future<void> getSupplierOffers({
    int? supplierProductId,
    String? status,
    int page = 1,
  }) async {
    _supplierProductId = supplierProductId;
    _status = _normalizeStatus(status);
    _currentPage = page;

    await _loadSupplierOffers();
  }

  Future<void> goToPage(int page) async {
    final currentState = state;

    if (currentState is! SupplierOffersSuccess) {
      return;
    }

    if (page < 1 ||
        page > currentState.lastPage ||
        page == currentState.currentPage) {
      return;
    }

    _currentPage = page;

    await _loadSupplierOffers();
  }

  Future<void> nextPage() async {
    final currentState = state;

    if (currentState is! SupplierOffersSuccess) {
      return;
    }

    if (currentState.currentPage >= currentState.lastPage) {
      return;
    }

    _currentPage = currentState.currentPage + 1;

    await _loadSupplierOffers();
  }

  Future<void> previousPage() async {
    final currentState = state;

    if (currentState is! SupplierOffersSuccess) {
      return;
    }

    if (currentState.currentPage <= 1) {
      return;
    }

    _currentPage = currentState.currentPage - 1;

    await _loadSupplierOffers();
  }

  Future<void> refreshAfterDelete() async {
    final currentState = state;

    if (currentState is SupplierOffersSuccess &&
        currentState.offers.length == 1 &&
        currentState.currentPage > 1) {
      _currentPage = currentState.currentPage - 1;
    }

    await _loadSupplierOffers();
  }

  Future<void> refreshCurrentPage() async {
    await _loadSupplierOffers();
  }

  Future<void> _loadSupplierOffers() async {
    emit(const SupplierOffersState.loading());

    final result = await repository.getSupplierOffers(
      supplierProductId: _supplierProductId,
      status: _status,
      page: _currentPage,
      perPage: _perPage,
    );

    result.when(
      success: (response) {
        final pagination = response.data;

        _currentPage = pagination.currentPage;

        emit(
          SupplierOffersState.success(
            offers: pagination.offers,
            currentPage: pagination.currentPage,
            lastPage: pagination.lastPage,
            perPage: pagination.perPage,
            total: pagination.total,
          ),
        );
      },
      failure: (error) {
        emit(
          SupplierOffersState.failure(
            error.message ??
                'Failed to load supplier offers',
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
