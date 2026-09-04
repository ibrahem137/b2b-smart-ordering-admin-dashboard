import 'package:dashboard/screens/supplier_offers/data/models/supplier_offer_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_offers_state.freezed.dart';

@freezed
sealed class SupplierOffersState with _$SupplierOffersState {
  const factory SupplierOffersState.failure(String message) =
      SupplierOffersFailure;

  const factory SupplierOffersState.initial() = SupplierOffersInitial;

  const factory SupplierOffersState.loading() = SupplierOffersLoading;

  const factory SupplierOffersState.success(List<SupplierOfferModel> offers) =
      SupplierOffersSuccess;
}
