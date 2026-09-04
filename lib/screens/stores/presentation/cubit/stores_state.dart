import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stores_state.freezed.dart';

@freezed
sealed class StoresState with _$StoresState {
  const factory StoresState.failure(String message) = StoresFailure;

  const factory StoresState.initial() = StoresInitial;

  const factory StoresState.loading() = StoresLoading;

  const factory StoresState.success({
    required List<StoreModel> stores,
    required int total,
  }) = StoresSuccess;
}
