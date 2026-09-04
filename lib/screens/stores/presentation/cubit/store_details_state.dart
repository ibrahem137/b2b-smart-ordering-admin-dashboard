import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_details_state.freezed.dart';

@freezed
sealed class StoreDetailsState with _$StoreDetailsState {
  const factory StoreDetailsState.failure(String message) = StoreDetailsFailure;

  const factory StoreDetailsState.initial() = StoreDetailsInitial;

  const factory StoreDetailsState.loading() = StoreDetailsLoading;

  const factory StoreDetailsState.success(StoreModel store) =
      StoreDetailsSuccess;
}
