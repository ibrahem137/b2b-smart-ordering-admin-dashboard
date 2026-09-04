import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/supplier_offers/domain/repos/supplier_offers_repository.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/supplier_offer_action_state.dart';

class DeleteSupplierOfferCubit extends Cubit<SupplierOfferActionState> {
  final SupplierOffersRepository repository;

  DeleteSupplierOfferCubit(this.repository)
    : super(const SupplierOfferActionState.initial());

  Future<void> deleteSupplierOffer(int id) async {
    emit(const SupplierOfferActionState.loading());

    final result = await repository.deleteSupplierOffer(id);

    result.when(
      success: (_) {
        emit(
          const SupplierOfferActionState.success(
            'Supplier offer deleted successfully',
          ),
        );
      },
      failure: (error) {
        emit(
          SupplierOfferActionState.failure(
            error.message ?? 'Failed to delete supplier offer',
          ),
        );
      },
    );
  }
}
