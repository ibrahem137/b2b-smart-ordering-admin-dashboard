import 'package:bloc/bloc.dart';
import 'package:dashboard/core/networking/api_result.dart';
import 'package:dashboard/screens/supplier_offers/data/models/create_supplier_offer_request.dart';
import 'package:dashboard/screens/supplier_offers/domain/repos/supplier_offers_repository.dart';
import 'package:dashboard/screens/supplier_offers/presentation/cubit/supplier_offer_action_state.dart';
import 'package:dio/dio.dart';

class CreateSupplierOfferCubit extends Cubit<SupplierOfferActionState> {
  final SupplierOffersRepository repository;

  CreateSupplierOfferCubit(this.repository)
    : super(const SupplierOfferActionState.initial());

  Future<void> createSupplierOffer({
    required int supplierProductId,
    required double offerPrice,
    int? offerStock,
    String? status,
    String? expiresAt,
    MultipartFile? image,
  }) async {
    emit(const SupplierOfferActionState.loading());

    final result = await repository.createSupplierOffer(
      CreateSupplierOfferRequest(
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
            'Supplier offer created successfully',
          ),
        );
      },
      failure: (error) {
        emit(
          SupplierOfferActionState.failure(
            error.message ?? 'Failed to create supplier offer',
          ),
        );
      },
    );
  }
}
