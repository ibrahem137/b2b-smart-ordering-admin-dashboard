import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stores_response.freezed.dart';
part 'stores_response.g.dart';

@freezed
abstract class StoresPagination with _$StoresPagination {
  const factory StoresPagination({
    @JsonKey(name: 'current_page') required int currentPage,

    @JsonKey(name: 'data') required List<StoreModel> stores,

    @JsonKey(name: 'last_page') required int lastPage,

    @JsonKey(name: 'per_page') required int perPage,

    required int total,
  }) = _StoresPagination;

  factory StoresPagination.fromJson(Map<String, dynamic> json) =>
      _$StoresPaginationFromJson(json);
}

@freezed
abstract class StoresResponse with _$StoresResponse {
  const factory StoresResponse({
    required StoresPagination data,
    String? message,
  }) = _StoresResponse;

  factory StoresResponse.fromJson(Map<String, dynamic> json) =>
      _$StoresResponseFromJson(json);
}
