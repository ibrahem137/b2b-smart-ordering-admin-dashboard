import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_offer_action_state.freezed.dart';

@freezed
sealed class SupplierOfferActionState with _$SupplierOfferActionState {
  const factory SupplierOfferActionState.failure(String message) =
      SupplierOfferActionFailure;

  const factory SupplierOfferActionState.initial() = SupplierOfferActionInitial;

  const factory SupplierOfferActionState.loading() = SupplierOfferActionLoading;

  const factory SupplierOfferActionState.success(String message) =
      SupplierOfferActionSuccess;
}
