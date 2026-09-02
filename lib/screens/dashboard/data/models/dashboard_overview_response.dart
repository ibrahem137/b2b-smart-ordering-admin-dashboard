import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_overview_response.freezed.dart';
part 'dashboard_overview_response.g.dart';

@freezed
abstract class DashboardLedgerStats with _$DashboardLedgerStats {
  const factory DashboardLedgerStats({
    @JsonKey(name: 'total_debits') @Default(0) double totalDebits,

    @JsonKey(name: 'total_credits') @Default(0) double totalCredits,

    @JsonKey(name: 'total_balance') @Default(0) double totalBalance,
  }) = _DashboardLedgerStats;

  factory DashboardLedgerStats.fromJson(Map<String, dynamic> json) =>
      _$DashboardLedgerStatsFromJson(json);
}

@freezed
abstract class DashboardOverviewData with _$DashboardOverviewData {
  const factory DashboardOverviewData({
    @JsonKey(name: 'stores_total') @Default(0) int storesTotal,

    @JsonKey(name: 'stores_active') @Default(0) int storesActive,

    @JsonKey(name: 'suppliers_total') @Default(0) int suppliersTotal,

    @JsonKey(name: 'suppliers_active') @Default(0) int suppliersActive,

    @JsonKey(name: 'products_total') @Default(0) int productsTotal,

    @JsonKey(name: 'products_available') @Default(0) int productsAvailable,

    @JsonKey(name: 'supplier_products_total')
    @Default(0)
    int supplierProductsTotal,

    @JsonKey(name: 'supplier_products_available')
    @Default(0)
    int supplierProductsAvailable,

    @JsonKey(name: 'orders_total') @Default(0) int ordersTotal,

    @JsonKey(name: 'orders_submitted') @Default(0) int ordersSubmitted,

    @JsonKey(name: 'orders_received') @Default(0) int ordersReceived,

    @JsonKey(name: 'orders_cancelled') @Default(0) int ordersCancelled,

    DashboardSalesStats? sales,

    DashboardLedgerStats? ledger,
  }) = _DashboardOverviewData;

  factory DashboardOverviewData.fromJson(Map<String, dynamic> json) =>
      _$DashboardOverviewDataFromJson(json);
}

@freezed
abstract class DashboardOverviewResponse with _$DashboardOverviewResponse {
  const factory DashboardOverviewResponse({
    DashboardOverviewData? data,
    String? message,
    dynamic errors,
  }) = _DashboardOverviewResponse;

  factory DashboardOverviewResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardOverviewResponseFromJson(json);
}

@freezed
abstract class DashboardSalesStats with _$DashboardSalesStats {
  const factory DashboardSalesStats({
    @JsonKey(name: 'total_count') @Default(0) int totalCount,

    @JsonKey(name: 'paid_total') @Default(0) double paidTotal,

    @JsonKey(name: 'paid_profit') @Default(0) double paidProfit,

    @JsonKey(name: 'paid_count') @Default(0) int paidCount,

    @JsonKey(name: 'draft_count') @Default(0) int draftCount,
  }) = _DashboardSalesStats;

  factory DashboardSalesStats.fromJson(Map<String, dynamic> json) =>
      _$DashboardSalesStatsFromJson(json);
}
