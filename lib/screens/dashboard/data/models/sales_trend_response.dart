import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_trend_response.freezed.dart';
part 'sales_trend_response.g.dart';

@freezed
abstract class SalesTrendItem with _$SalesTrendItem {
  const factory SalesTrendItem({
    required String month,
    required String total,
    required String profit,
  }) = _SalesTrendItem;

  factory SalesTrendItem.fromJson(Map<String, dynamic> json) =>
      _$SalesTrendItemFromJson(json);
}

@freezed
abstract class SalesTrendResponse with _$SalesTrendResponse {
  const factory SalesTrendResponse({
    @Default([]) List<SalesTrendItem> data,

    String? message,
    dynamic errors,
  }) = _SalesTrendResponse;

  factory SalesTrendResponse.fromJson(Map<String, dynamic> json) =>
      _$SalesTrendResponseFromJson(json);
}
