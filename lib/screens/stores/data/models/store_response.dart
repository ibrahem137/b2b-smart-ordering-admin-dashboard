import 'package:dashboard/screens/stores/data/models/store_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_response.freezed.dart';
part 'store_response.g.dart';

@freezed
abstract class StoreResponse with _$StoreResponse {
  const factory StoreResponse({required StoreModel data, String? message}) =
      _StoreResponse;

  factory StoreResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreResponseFromJson(json);
}
