import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/supplier_offers/data/models/update_supplier_offer_request.dart';
import 'package:dashboard/screens/supplier_offers/domain/repos/supplier_offers_repository.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/supplier_offer_action_state.dart';
import 'package:dio/dio.dart';

class UpdateSupplierOfferCubit extends Cubit<SupplierOfferActionState> {
  final SupplierOffersRepository repository;

  UpdateSupplierOfferCubit(this.repository)
    : super(const SupplierOfferActionState.initial());

  Future<void> updateSupplierOffer({
    required int id,
    int? supplierProductId,
    double? offerPrice,
    int? offerStock,
    String? status,
    String? expiresAt,
    MultipartFile? image,
  }) async {
    emit(const SupplierOfferActionState.loading());

    final result = await repository.updateSupplierOffer(
      UpdateSupplierOfferRequest(
        id: id,
        supplierProductId: supplierProductId,
        offerPrice: offerPrice,
        offerStock: offerStock,
        status: status,
        expiresAt: expiresAt,
        image: image,
      ),
    );

    result.when(
      success: (_) {
        emit(
          const SupplierOfferActionState.success(
            'Supplier offer updated successfully',
          ),
        );
      },
      failure: (error) {
        emit(
          SupplierOfferActionState.failure(
            error.message ?? 'Failed to update supplier offer',
          ),
        );
      },
    );
  }
}
