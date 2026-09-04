import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_store_state.freezed.dart';

@freezed
sealed class DeleteStoreState with _$DeleteStoreState {
  const factory DeleteStoreState.failure(String message) = DeleteStoreFailure;

  const factory DeleteStoreState.initial() = DeleteStoreInitial;

  const factory DeleteStoreState.loading() = DeleteStoreLoading;

  const factory DeleteStoreState.success() = DeleteStoreSuccess;
}
