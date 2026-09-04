import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_action_state.freezed.dart';

@freezed
sealed class StoreActionState with _$StoreActionState {
  const factory StoreActionState.failure(String message) = StoreActionFailure;

  const factory StoreActionState.initial() = StoreActionInitial;

  const factory StoreActionState.loading() = StoreActionLoading;

  const factory StoreActionState.success(StoreModel store) = StoreActionSuccess;
}
