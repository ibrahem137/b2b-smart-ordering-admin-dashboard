import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_order_status_state.freezed.dart';

@freezed
sealed class UpdateOrderStatusState with _$UpdateOrderStatusState {
  const factory UpdateOrderStatusState.failure(String message) =
      UpdateOrderStatusFailure;

  const factory UpdateOrderStatusState.initial() = UpdateOrderStatusInitial;

  const factory UpdateOrderStatusState.loading() = UpdateOrderStatusLoading;

  const factory UpdateOrderStatusState.success() = UpdateOrderStatusSuccess;
}
