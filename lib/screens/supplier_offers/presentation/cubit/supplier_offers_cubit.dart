import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/supplier_offers/domain/repos/supplier_offers_repository.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/supplier_offers_state.dart';

class SupplierOffersCubit extends Cubit<SupplierOffersState> {
  final SupplierOffersRepository repository;

  SupplierOffersCubit(this.repository)
    : super(const SupplierOffersState.initial());

  Future<void> getSupplierOffers({
    int? supplierProductId,
    String? status,
  }) async {
    emit(const SupplierOffersState.loading());

    final result = await repository.getSupplierOffers(
      supplierProductId: supplierProductId,
      status: status,
    );

    result.when(
      success: (response) {
        emit(SupplierOffersState.success(response.data.offers));
      },
      failure: (error) {
        emit(
          SupplierOffersState.failure(
            error.message ?? 'Failed to load supplier offers',
          ),
        );
      },
    );
  }
}
