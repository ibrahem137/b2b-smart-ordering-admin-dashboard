// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_overview_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardLedgerStats _$DashboardLedgerStatsFromJson(
  Map<String, dynamic> json,
) => _DashboardLedgerStats(
  totalDebits: (json['total_debits'] as num?)?.toDouble() ?? 0,
  totalCredits: (json['total_credits'] as num?)?.toDouble() ?? 0,
  totalBalance: (json['total_balance'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$DashboardLedgerStatsToJson(
  _DashboardLedgerStats instance,
) => <String, dynamic>{
  'total_debits': instance.totalDebits,
  'total_credits': instance.totalCredits,
  'total_balance': instance.totalBalance,
};

_DashboardOverviewData _$DashboardOverviewDataFromJson(
  Map<String, dynamic> json,
) => _DashboardOverviewData(
  storesTotal: (json['stores_total'] as num?)?.toInt() ?? 0,
  storesActive: (json['stores_active'] as num?)?.toInt() ?? 0,
  suppliersTotal: (json['suppliers_total'] as num?)?.toInt() ?? 0,
  suppliersActive: (json['suppliers_active'] as num?)?.toInt() ?? 0,
  productsTotal: (json['products_total'] as num?)?.toInt() ?? 0,
  productsAvailable: (json['products_available'] as num?)?.toInt() ?? 0,
  supplierProductsTotal:
      (json['supplier_products_total'] as num?)?.toInt() ?? 0,
  supplierProductsAvailable:
      (json['supplier_products_available'] as num?)?.toInt() ?? 0,
  ordersTotal: (json['orders_total'] as num?)?.toInt() ?? 0,
  ordersSubmitted: (json['orders_submitted'] as num?)?.toInt() ?? 0,
  ordersReceived: (json['orders_received'] as num?)?.toInt() ?? 0,
  ordersCancelled: (json['orders_cancelled'] as num?)?.toInt() ?? 0,
  sales: json['sales'] == null
      ? null
      : DashboardSalesStats.fromJson(json['sales'] as Map<String, dynamic>),
  ledger: json['ledger'] == null
      ? null
      : DashboardLedgerStats.fromJson(json['ledger'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DashboardOverviewDataToJson(
  _DashboardOverviewData instance,
) => <String, dynamic>{
  'stores_total': instance.storesTotal,
  'stores_active': instance.storesActive,
  'suppliers_total': instance.suppliersTotal,
  'suppliers_active': instance.suppliersActive,
  'products_total': instance.productsTotal,
  'products_available': instance.productsAvailable,
  'supplier_products_total': instance.supplierProductsTotal,
  'supplier_products_available': instance.supplierProductsAvailable,
  'orders_total': instance.ordersTotal,
  'orders_submitted': instance.ordersSubmitted,
  'orders_received': instance.ordersReceived,
  'orders_cancelled': instance.ordersCancelled,
  'sales': instance.sales,
  'ledger': instance.ledger,
};

_DashboardOverviewResponse _$DashboardOverviewResponseFromJson(
  Map<String, dynamic> json,
) => _DashboardOverviewResponse(
  data: json['data'] == null
      ? null
      : DashboardOverviewData.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String?,
  errors: json['errors'],
);

Map<String, dynamic> _$DashboardOverviewResponseToJson(
  _DashboardOverviewResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'errors': instance.errors,
};

_DashboardSalesStats _$DashboardSalesStatsFromJson(Map<String, dynamic> json) =>
    _DashboardSalesStats(
      totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
      paidTotal: (json['paid_total'] as num?)?.toDouble() ?? 0,
      paidProfit: (json['paid_profit'] as num?)?.toDouble() ?? 0,
      paidCount: (json['paid_count'] as num?)?.toInt() ?? 0,
      draftCount: (json['draft_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DashboardSalesStatsToJson(
  _DashboardSalesStats instance,
) => <String, dynamic>{
  'total_count': instance.totalCount,
  'paid_total': instance.paidTotal,
  'paid_profit': instance.paidProfit,
  'paid_count': instance.paidCount,
  'draft_count': instance.draftCount,
};
