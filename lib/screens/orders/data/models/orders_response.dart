import 'package:dashboard/screens/orders/data/models/order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_response.freezed.dart';
part 'orders_response.g.dart';

@freezed
abstract class OrdersPagination with _$OrdersPagination {
  const factory OrdersPagination({
    @JsonKey(name: 'current_page') required int currentPage,

    @JsonKey(name: 'data') required List<OrderModel> orders,

    @JsonKey(name: 'last_page') required int lastPage,

    @JsonKey(name: 'per_page') required int perPage,

    required int total,
  }) = _OrdersPagination;

  factory OrdersPagination.fromJson(Map<String, dynamic> json) =>
      _$OrdersPaginationFromJson(json);
}

@freezed
abstract class OrdersResponse with _$OrdersResponse {
  const factory OrdersResponse({
    OrdersPagination? data,
    String? message,
    dynamic errors,
  }) = _OrdersResponse;

  factory OrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersResponseFromJson(json);
}
