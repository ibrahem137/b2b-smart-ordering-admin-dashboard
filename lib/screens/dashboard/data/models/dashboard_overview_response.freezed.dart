// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_overview_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardLedgerStats {

@JsonKey(name: 'total_debits') double get totalDebits;@JsonKey(name: 'total_credits') double get totalCredits;@JsonKey(name: 'total_balance') double get totalBalance;
/// Create a copy of DashboardLedgerStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardLedgerStatsCopyWith<DashboardLedgerStats> get copyWith => _$DashboardLedgerStatsCopyWithImpl<DashboardLedgerStats>(this as DashboardLedgerStats, _$identity);

  /// Serializes this DashboardLedgerStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardLedgerStats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardLedgerStats&&(identical(other.totalDebits, _this.totalDebits) || other.totalDebits == _this.totalDebits)&&(identical(other.totalCredits, _this.totalCredits) || other.totalCredits == _this.totalCredits)&&(identical(other.totalBalance, _this.totalBalance) || other.totalBalance == _this.totalBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardLedgerStats;
  return Object.hash(runtimeType,_this.totalDebits,_this.totalCredits,_this.totalBalance);
}

@override
String toString() {
  final _this = this as DashboardLedgerStats;
  return 'DashboardLedgerStats(totalDebits: ${_this.totalDebits}, totalCredits: ${_this.totalCredits}, totalBalance: ${_this.totalBalance})';
}


}

/// @nodoc
abstract mixin class $DashboardLedgerStatsCopyWith<$Res>  {
  factory $DashboardLedgerStatsCopyWith(DashboardLedgerStats value, $Res Function(DashboardLedgerStats) _then) = _$DashboardLedgerStatsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_debits') double totalDebits,@JsonKey(name: 'total_credits') double totalCredits,@JsonKey(name: 'total_balance') double totalBalance
});




}
/// @nodoc
class _$DashboardLedgerStatsCopyWithImpl<$Res>
    implements $DashboardLedgerStatsCopyWith<$Res> {
  _$DashboardLedgerStatsCopyWithImpl(this._self, this._then);

  final DashboardLedgerStats _self;
  final $Res Function(DashboardLedgerStats) _then;

/// Create a copy of DashboardLedgerStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDebits = null,Object? totalCredits = null,Object? totalBalance = null,}) {
  return _then(DashboardLedgerStats(
totalDebits: null == totalDebits ? _self.totalDebits : totalDebits // ignore: cast_nullable_to_non_nullable
as double,totalCredits: null == totalCredits ? _self.totalCredits : totalCredits // ignore: cast_nullable_to_non_nullable
as double,totalBalance: null == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardLedgerStats].
extension DashboardLedgerStatsPatterns on DashboardLedgerStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardLedgerStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardLedgerStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardLedgerStats value)  $default,){
final _that = this;
switch (_that) {
case _DashboardLedgerStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardLedgerStats value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardLedgerStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_debits')  double totalDebits, @JsonKey(name: 'total_credits')  double totalCredits, @JsonKey(name: 'total_balance')  double totalBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardLedgerStats() when $default != null:
return $default(_that.totalDebits,_that.totalCredits,_that.totalBalance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_debits')  double totalDebits, @JsonKey(name: 'total_credits')  double totalCredits, @JsonKey(name: 'total_balance')  double totalBalance)  $default,) {final _that = this;
switch (_that) {
case _DashboardLedgerStats():
return $default(_that.totalDebits,_that.totalCredits,_that.totalBalance);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_debits')  double totalDebits, @JsonKey(name: 'total_credits')  double totalCredits, @JsonKey(name: 'total_balance')  double totalBalance)?  $default,) {final _that = this;
switch (_that) {
case _DashboardLedgerStats() when $default != null:
return $default(_that.totalDebits,_that.totalCredits,_that.totalBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardLedgerStats implements DashboardLedgerStats {
  const _DashboardLedgerStats({@JsonKey(name: 'total_debits') this.totalDebits = 0, @JsonKey(name: 'total_credits') this.totalCredits = 0, @JsonKey(name: 'total_balance') this.totalBalance = 0});
  factory _DashboardLedgerStats.fromJson(Map<String, dynamic> json) => _$DashboardLedgerStatsFromJson(json);

@override@JsonKey(name: 'total_debits') final  double totalDebits;
@override@JsonKey(name: 'total_credits') final  double totalCredits;
@override@JsonKey(name: 'total_balance') final  double totalBalance;

/// Create a copy of DashboardLedgerStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardLedgerStatsCopyWith<_DashboardLedgerStats> get copyWith => __$DashboardLedgerStatsCopyWithImpl<_DashboardLedgerStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardLedgerStatsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardLedgerStats&&(identical(other.totalDebits, totalDebits) || other.totalDebits == totalDebits)&&(identical(other.totalCredits, totalCredits) || other.totalCredits == totalCredits)&&(identical(other.totalBalance, totalBalance) || other.totalBalance == totalBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,totalDebits,totalCredits,totalBalance);
}

@override
String toString() {
    return 'DashboardLedgerStats(totalDebits: $totalDebits, totalCredits: $totalCredits, totalBalance: $totalBalance)';
}


}

/// @nodoc
abstract mixin class _$DashboardLedgerStatsCopyWith<$Res> implements $DashboardLedgerStatsCopyWith<$Res> {
  factory _$DashboardLedgerStatsCopyWith(_DashboardLedgerStats value, $Res Function(_DashboardLedgerStats) _then) = __$DashboardLedgerStatsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_debits') double totalDebits,@JsonKey(name: 'total_credits') double totalCredits,@JsonKey(name: 'total_balance') double totalBalance
});




}
/// @nodoc
class __$DashboardLedgerStatsCopyWithImpl<$Res>
    implements _$DashboardLedgerStatsCopyWith<$Res> {
  __$DashboardLedgerStatsCopyWithImpl(this._self, this._then);

  final _DashboardLedgerStats _self;
  final $Res Function(_DashboardLedgerStats) _then;

/// Create a copy of DashboardLedgerStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDebits = null,Object? totalCredits = null,Object? totalBalance = null,}) {
  return _then(_DashboardLedgerStats(
totalDebits: null == totalDebits ? _self.totalDebits : totalDebits // ignore: cast_nullable_to_non_nullable
as double,totalCredits: null == totalCredits ? _self.totalCredits : totalCredits // ignore: cast_nullable_to_non_nullable
as double,totalBalance: null == totalBalance ? _self.totalBalance : totalBalance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DashboardOverviewData {

@JsonKey(name: 'stores_total') int get storesTotal;@JsonKey(name: 'stores_active') int get storesActive;@JsonKey(name: 'suppliers_total') int get suppliersTotal;@JsonKey(name: 'suppliers_active') int get suppliersActive;@JsonKey(name: 'products_total') int get productsTotal;@JsonKey(name: 'products_available') int get productsAvailable;@JsonKey(name: 'supplier_products_total') int get supplierProductsTotal;@JsonKey(name: 'supplier_products_available') int get supplierProductsAvailable;@JsonKey(name: 'orders_total') int get ordersTotal;@JsonKey(name: 'orders_submitted') int get ordersSubmitted;@JsonKey(name: 'orders_received') int get ordersReceived;@JsonKey(name: 'orders_cancelled') int get ordersCancelled; DashboardSalesStats? get sales; DashboardLedgerStats? get ledger;
/// Create a copy of DashboardOverviewData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardOverviewDataCopyWith<DashboardOverviewData> get copyWith => _$DashboardOverviewDataCopyWithImpl<DashboardOverviewData>(this as DashboardOverviewData, _$identity);

  /// Serializes this DashboardOverviewData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardOverviewData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardOverviewData&&(identical(other.storesTotal, _this.storesTotal) || other.storesTotal == _this.storesTotal)&&(identical(other.storesActive, _this.storesActive) || other.storesActive == _this.storesActive)&&(identical(other.suppliersTotal, _this.suppliersTotal) || other.suppliersTotal == _this.suppliersTotal)&&(identical(other.suppliersActive, _this.suppliersActive) || other.suppliersActive == _this.suppliersActive)&&(identical(other.productsTotal, _this.productsTotal) || other.productsTotal == _this.productsTotal)&&(identical(other.productsAvailable, _this.productsAvailable) || other.productsAvailable == _this.productsAvailable)&&(identical(other.supplierProductsTotal, _this.supplierProductsTotal) || other.supplierProductsTotal == _this.supplierProductsTotal)&&(identical(other.supplierProductsAvailable, _this.supplierProductsAvailable) || other.supplierProductsAvailable == _this.supplierProductsAvailable)&&(identical(other.ordersTotal, _this.ordersTotal) || other.ordersTotal == _this.ordersTotal)&&(identical(other.ordersSubmitted, _this.ordersSubmitted) || other.ordersSubmitted == _this.ordersSubmitted)&&(identical(other.ordersReceived, _this.ordersReceived) || other.ordersReceived == _this.ordersReceived)&&(identical(other.ordersCancelled, _this.ordersCancelled) || other.ordersCancelled == _this.ordersCancelled)&&(identical(other.sales, _this.sales) || other.sales == _this.sales)&&(identical(other.ledger, _this.ledger) || other.ledger == _this.ledger));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardOverviewData;
  return Object.hash(runtimeType,_this.storesTotal,_this.storesActive,_this.suppliersTotal,_this.suppliersActive,_this.productsTotal,_this.productsAvailable,_this.supplierProductsTotal,_this.supplierProductsAvailable,_this.ordersTotal,_this.ordersSubmitted,_this.ordersReceived,_this.ordersCancelled,_this.sales,_this.ledger);
}

@override
String toString() {
  final _this = this as DashboardOverviewData;
  return 'DashboardOverviewData(storesTotal: ${_this.storesTotal}, storesActive: ${_this.storesActive}, suppliersTotal: ${_this.suppliersTotal}, suppliersActive: ${_this.suppliersActive}, productsTotal: ${_this.productsTotal}, productsAvailable: ${_this.productsAvailable}, supplierProductsTotal: ${_this.supplierProductsTotal}, supplierProductsAvailable: ${_this.supplierProductsAvailable}, ordersTotal: ${_this.ordersTotal}, ordersSubmitted: ${_this.ordersSubmitted}, ordersReceived: ${_this.ordersReceived}, ordersCancelled: ${_this.ordersCancelled}, sales: ${_this.sales}, ledger: ${_this.ledger})';
}


}

/// @nodoc
abstract mixin class $DashboardOverviewDataCopyWith<$Res>  {
  factory $DashboardOverviewDataCopyWith(DashboardOverviewData value, $Res Function(DashboardOverviewData) _then) = _$DashboardOverviewDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'stores_total') int storesTotal,@JsonKey(name: 'stores_active') int storesActive,@JsonKey(name: 'suppliers_total') int suppliersTotal,@JsonKey(name: 'suppliers_active') int suppliersActive,@JsonKey(name: 'products_total') int productsTotal,@JsonKey(name: 'products_available') int productsAvailable,@JsonKey(name: 'supplier_products_total') int supplierProductsTotal,@JsonKey(name: 'supplier_products_available') int supplierProductsAvailable,@JsonKey(name: 'orders_total') int ordersTotal,@JsonKey(name: 'orders_submitted') int ordersSubmitted,@JsonKey(name: 'orders_received') int ordersReceived,@JsonKey(name: 'orders_cancelled') int ordersCancelled, DashboardSalesStats? sales, DashboardLedgerStats? ledger
});


$DashboardSalesStatsCopyWith<$Res>? get sales;$DashboardLedgerStatsCopyWith<$Res>? get ledger;

}
/// @nodoc
class _$DashboardOverviewDataCopyWithImpl<$Res>
    implements $DashboardOverviewDataCopyWith<$Res> {
  _$DashboardOverviewDataCopyWithImpl(this._self, this._then);

  final DashboardOverviewData _self;
  final $Res Function(DashboardOverviewData) _then;

/// Create a copy of DashboardOverviewData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storesTotal = null,Object? storesActive = null,Object? suppliersTotal = null,Object? suppliersActive = null,Object? productsTotal = null,Object? productsAvailable = null,Object? supplierProductsTotal = null,Object? supplierProductsAvailable = null,Object? ordersTotal = null,Object? ordersSubmitted = null,Object? ordersReceived = null,Object? ordersCancelled = null,Object? sales = freezed,Object? ledger = freezed,}) {
  return _then(DashboardOverviewData(
storesTotal: null == storesTotal ? _self.storesTotal : storesTotal // ignore: cast_nullable_to_non_nullable
as int,storesActive: null == storesActive ? _self.storesActive : storesActive // ignore: cast_nullable_to_non_nullable
as int,suppliersTotal: null == suppliersTotal ? _self.suppliersTotal : suppliersTotal // ignore: cast_nullable_to_non_nullable
as int,suppliersActive: null == suppliersActive ? _self.suppliersActive : suppliersActive // ignore: cast_nullable_to_non_nullable
as int,productsTotal: null == productsTotal ? _self.productsTotal : productsTotal // ignore: cast_nullable_to_non_nullable
as int,productsAvailable: null == productsAvailable ? _self.productsAvailable : productsAvailable // ignore: cast_nullable_to_non_nullable
as int,supplierProductsTotal: null == supplierProductsTotal ? _self.supplierProductsTotal : supplierProductsTotal // ignore: cast_nullable_to_non_nullable
as int,supplierProductsAvailable: null == supplierProductsAvailable ? _self.supplierProductsAvailable : supplierProductsAvailable // ignore: cast_nullable_to_non_nullable
as int,ordersTotal: null == ordersTotal ? _self.ordersTotal : ordersTotal // ignore: cast_nullable_to_non_nullable
as int,ordersSubmitted: null == ordersSubmitted ? _self.ordersSubmitted : ordersSubmitted // ignore: cast_nullable_to_non_nullable
as int,ordersReceived: null == ordersReceived ? _self.ordersReceived : ordersReceived // ignore: cast_nullable_to_non_nullable
as int,ordersCancelled: null == ordersCancelled ? _self.ordersCancelled : ordersCancelled // ignore: cast_nullable_to_non_nullable
as int,sales: freezed == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as DashboardSalesStats?,ledger: freezed == ledger ? _self.ledger : ledger // ignore: cast_nullable_to_non_nullable
as DashboardLedgerStats?,
  ));
}
/// Create a copy of DashboardOverviewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardSalesStatsCopyWith<$Res>? get sales {
    if (_self.sales == null) {
    return null;
  }

  return $DashboardSalesStatsCopyWith<$Res>(_self.sales!, (value) {
    return _then(_self.copyWith(sales: value));
  });
}/// Create a copy of DashboardOverviewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardLedgerStatsCopyWith<$Res>? get ledger {
    if (_self.ledger == null) {
    return null;
  }

  return $DashboardLedgerStatsCopyWith<$Res>(_self.ledger!, (value) {
    return _then(_self.copyWith(ledger: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardOverviewData].
extension DashboardOverviewDataPatterns on DashboardOverviewData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardOverviewData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardOverviewData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardOverviewData value)  $default,){
final _that = this;
switch (_that) {
case _DashboardOverviewData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardOverviewData value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardOverviewData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'stores_total')  int storesTotal, @JsonKey(name: 'stores_active')  int storesActive, @JsonKey(name: 'suppliers_total')  int suppliersTotal, @JsonKey(name: 'suppliers_active')  int suppliersActive, @JsonKey(name: 'products_total')  int productsTotal, @JsonKey(name: 'products_available')  int productsAvailable, @JsonKey(name: 'supplier_products_total')  int supplierProductsTotal, @JsonKey(name: 'supplier_products_available')  int supplierProductsAvailable, @JsonKey(name: 'orders_total')  int ordersTotal, @JsonKey(name: 'orders_submitted')  int ordersSubmitted, @JsonKey(name: 'orders_received')  int ordersReceived, @JsonKey(name: 'orders_cancelled')  int ordersCancelled,  DashboardSalesStats? sales,  DashboardLedgerStats? ledger)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardOverviewData() when $default != null:
return $default(_that.storesTotal,_that.storesActive,_that.suppliersTotal,_that.suppliersActive,_that.productsTotal,_that.productsAvailable,_that.supplierProductsTotal,_that.supplierProductsAvailable,_that.ordersTotal,_that.ordersSubmitted,_that.ordersReceived,_that.ordersCancelled,_that.sales,_that.ledger);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'stores_total')  int storesTotal, @JsonKey(name: 'stores_active')  int storesActive, @JsonKey(name: 'suppliers_total')  int suppliersTotal, @JsonKey(name: 'suppliers_active')  int suppliersActive, @JsonKey(name: 'products_total')  int productsTotal, @JsonKey(name: 'products_available')  int productsAvailable, @JsonKey(name: 'supplier_products_total')  int supplierProductsTotal, @JsonKey(name: 'supplier_products_available')  int supplierProductsAvailable, @JsonKey(name: 'orders_total')  int ordersTotal, @JsonKey(name: 'orders_submitted')  int ordersSubmitted, @JsonKey(name: 'orders_received')  int ordersReceived, @JsonKey(name: 'orders_cancelled')  int ordersCancelled,  DashboardSalesStats? sales,  DashboardLedgerStats? ledger)  $default,) {final _that = this;
switch (_that) {
case _DashboardOverviewData():
return $default(_that.storesTotal,_that.storesActive,_that.suppliersTotal,_that.suppliersActive,_that.productsTotal,_that.productsAvailable,_that.supplierProductsTotal,_that.supplierProductsAvailable,_that.ordersTotal,_that.ordersSubmitted,_that.ordersReceived,_that.ordersCancelled,_that.sales,_that.ledger);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'stores_total')  int storesTotal, @JsonKey(name: 'stores_active')  int storesActive, @JsonKey(name: 'suppliers_total')  int suppliersTotal, @JsonKey(name: 'suppliers_active')  int suppliersActive, @JsonKey(name: 'products_total')  int productsTotal, @JsonKey(name: 'products_available')  int productsAvailable, @JsonKey(name: 'supplier_products_total')  int supplierProductsTotal, @JsonKey(name: 'supplier_products_available')  int supplierProductsAvailable, @JsonKey(name: 'orders_total')  int ordersTotal, @JsonKey(name: 'orders_submitted')  int ordersSubmitted, @JsonKey(name: 'orders_received')  int ordersReceived, @JsonKey(name: 'orders_cancelled')  int ordersCancelled,  DashboardSalesStats? sales,  DashboardLedgerStats? ledger)?  $default,) {final _that = this;
switch (_that) {
case _DashboardOverviewData() when $default != null:
return $default(_that.storesTotal,_that.storesActive,_that.suppliersTotal,_that.suppliersActive,_that.productsTotal,_that.productsAvailable,_that.supplierProductsTotal,_that.supplierProductsAvailable,_that.ordersTotal,_that.ordersSubmitted,_that.ordersReceived,_that.ordersCancelled,_that.sales,_that.ledger);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardOverviewData implements DashboardOverviewData {
  const _DashboardOverviewData({@JsonKey(name: 'stores_total') this.storesTotal = 0, @JsonKey(name: 'stores_active') this.storesActive = 0, @JsonKey(name: 'suppliers_total') this.suppliersTotal = 0, @JsonKey(name: 'suppliers_active') this.suppliersActive = 0, @JsonKey(name: 'products_total') this.productsTotal = 0, @JsonKey(name: 'products_available') this.productsAvailable = 0, @JsonKey(name: 'supplier_products_total') this.supplierProductsTotal = 0, @JsonKey(name: 'supplier_products_available') this.supplierProductsAvailable = 0, @JsonKey(name: 'orders_total') this.ordersTotal = 0, @JsonKey(name: 'orders_submitted') this.ordersSubmitted = 0, @JsonKey(name: 'orders_received') this.ordersReceived = 0, @JsonKey(name: 'orders_cancelled') this.ordersCancelled = 0, this.sales, this.ledger});
  factory _DashboardOverviewData.fromJson(Map<String, dynamic> json) => _$DashboardOverviewDataFromJson(json);

@override@JsonKey(name: 'stores_total') final  int storesTotal;
@override@JsonKey(name: 'stores_active') final  int storesActive;
@override@JsonKey(name: 'suppliers_total') final  int suppliersTotal;
@override@JsonKey(name: 'suppliers_active') final  int suppliersActive;
@override@JsonKey(name: 'products_total') final  int productsTotal;
@override@JsonKey(name: 'products_available') final  int productsAvailable;
@override@JsonKey(name: 'supplier_products_total') final  int supplierProductsTotal;
@override@JsonKey(name: 'supplier_products_available') final  int supplierProductsAvailable;
@override@JsonKey(name: 'orders_total') final  int ordersTotal;
@override@JsonKey(name: 'orders_submitted') final  int ordersSubmitted;
@override@JsonKey(name: 'orders_received') final  int ordersReceived;
@override@JsonKey(name: 'orders_cancelled') final  int ordersCancelled;
@override final  DashboardSalesStats? sales;
@override final  DashboardLedgerStats? ledger;

/// Create a copy of DashboardOverviewData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardOverviewDataCopyWith<_DashboardOverviewData> get copyWith => __$DashboardOverviewDataCopyWithImpl<_DashboardOverviewData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardOverviewDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardOverviewData&&(identical(other.storesTotal, storesTotal) || other.storesTotal == storesTotal)&&(identical(other.storesActive, storesActive) || other.storesActive == storesActive)&&(identical(other.suppliersTotal, suppliersTotal) || other.suppliersTotal == suppliersTotal)&&(identical(other.suppliersActive, suppliersActive) || other.suppliersActive == suppliersActive)&&(identical(other.productsTotal, productsTotal) || other.productsTotal == productsTotal)&&(identical(other.productsAvailable, productsAvailable) || other.productsAvailable == productsAvailable)&&(identical(other.supplierProductsTotal, supplierProductsTotal) || other.supplierProductsTotal == supplierProductsTotal)&&(identical(other.supplierProductsAvailable, supplierProductsAvailable) || other.supplierProductsAvailable == supplierProductsAvailable)&&(identical(other.ordersTotal, ordersTotal) || other.ordersTotal == ordersTotal)&&(identical(other.ordersSubmitted, ordersSubmitted) || other.ordersSubmitted == ordersSubmitted)&&(identical(other.ordersReceived, ordersReceived) || other.ordersReceived == ordersReceived)&&(identical(other.ordersCancelled, ordersCancelled) || other.ordersCancelled == ordersCancelled)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.ledger, ledger) || other.ledger == ledger));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,storesTotal,storesActive,suppliersTotal,suppliersActive,productsTotal,productsAvailable,supplierProductsTotal,supplierProductsAvailable,ordersTotal,ordersSubmitted,ordersReceived,ordersCancelled,sales,ledger);
}

@override
String toString() {
    return 'DashboardOverviewData(storesTotal: $storesTotal, storesActive: $storesActive, suppliersTotal: $suppliersTotal, suppliersActive: $suppliersActive, productsTotal: $productsTotal, productsAvailable: $productsAvailable, supplierProductsTotal: $supplierProductsTotal, supplierProductsAvailable: $supplierProductsAvailable, ordersTotal: $ordersTotal, ordersSubmitted: $ordersSubmitted, ordersReceived: $ordersReceived, ordersCancelled: $ordersCancelled, sales: $sales, ledger: $ledger)';
}


}

/// @nodoc
abstract mixin class _$DashboardOverviewDataCopyWith<$Res> implements $DashboardOverviewDataCopyWith<$Res> {
  factory _$DashboardOverviewDataCopyWith(_DashboardOverviewData value, $Res Function(_DashboardOverviewData) _then) = __$DashboardOverviewDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'stores_total') int storesTotal,@JsonKey(name: 'stores_active') int storesActive,@JsonKey(name: 'suppliers_total') int suppliersTotal,@JsonKey(name: 'suppliers_active') int suppliersActive,@JsonKey(name: 'products_total') int productsTotal,@JsonKey(name: 'products_available') int productsAvailable,@JsonKey(name: 'supplier_products_total') int supplierProductsTotal,@JsonKey(name: 'supplier_products_available') int supplierProductsAvailable,@JsonKey(name: 'orders_total') int ordersTotal,@JsonKey(name: 'orders_submitted') int ordersSubmitted,@JsonKey(name: 'orders_received') int ordersReceived,@JsonKey(name: 'orders_cancelled') int ordersCancelled, DashboardSalesStats? sales, DashboardLedgerStats? ledger
});


@override $DashboardSalesStatsCopyWith<$Res>? get sales;@override $DashboardLedgerStatsCopyWith<$Res>? get ledger;

}
/// @nodoc
class __$DashboardOverviewDataCopyWithImpl<$Res>
    implements _$DashboardOverviewDataCopyWith<$Res> {
  __$DashboardOverviewDataCopyWithImpl(this._self, this._then);

  final _DashboardOverviewData _self;
  final $Res Function(_DashboardOverviewData) _then;

/// Create a copy of DashboardOverviewData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storesTotal = null,Object? storesActive = null,Object? suppliersTotal = null,Object? suppliersActive = null,Object? productsTotal = null,Object? productsAvailable = null,Object? supplierProductsTotal = null,Object? supplierProductsAvailable = null,Object? ordersTotal = null,Object? ordersSubmitted = null,Object? ordersReceived = null,Object? ordersCancelled = null,Object? sales = freezed,Object? ledger = freezed,}) {
  return _then(_DashboardOverviewData(
storesTotal: null == storesTotal ? _self.storesTotal : storesTotal // ignore: cast_nullable_to_non_nullable
as int,storesActive: null == storesActive ? _self.storesActive : storesActive // ignore: cast_nullable_to_non_nullable
as int,suppliersTotal: null == suppliersTotal ? _self.suppliersTotal : suppliersTotal // ignore: cast_nullable_to_non_nullable
as int,suppliersActive: null == suppliersActive ? _self.suppliersActive : suppliersActive // ignore: cast_nullable_to_non_nullable
as int,productsTotal: null == productsTotal ? _self.productsTotal : productsTotal // ignore: cast_nullable_to_non_nullable
as int,productsAvailable: null == productsAvailable ? _self.productsAvailable : productsAvailable // ignore: cast_nullable_to_non_nullable
as int,supplierProductsTotal: null == supplierProductsTotal ? _self.supplierProductsTotal : supplierProductsTotal // ignore: cast_nullable_to_non_nullable
as int,supplierProductsAvailable: null == supplierProductsAvailable ? _self.supplierProductsAvailable : supplierProductsAvailable // ignore: cast_nullable_to_non_nullable
as int,ordersTotal: null == ordersTotal ? _self.ordersTotal : ordersTotal // ignore: cast_nullable_to_non_nullable
as int,ordersSubmitted: null == ordersSubmitted ? _self.ordersSubmitted : ordersSubmitted // ignore: cast_nullable_to_non_nullable
as int,ordersReceived: null == ordersReceived ? _self.ordersReceived : ordersReceived // ignore: cast_nullable_to_non_nullable
as int,ordersCancelled: null == ordersCancelled ? _self.ordersCancelled : ordersCancelled // ignore: cast_nullable_to_non_nullable
as int,sales: freezed == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as DashboardSalesStats?,ledger: freezed == ledger ? _self.ledger : ledger // ignore: cast_nullable_to_non_nullable
as DashboardLedgerStats?,
  ));
}

/// Create a copy of DashboardOverviewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardSalesStatsCopyWith<$Res>? get sales {
    if (_self.sales == null) {
    return null;
  }

  return $DashboardSalesStatsCopyWith<$Res>(_self.sales!, (value) {
    return _then(_self.copyWith(sales: value));
  });
}/// Create a copy of DashboardOverviewData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardLedgerStatsCopyWith<$Res>? get ledger {
    if (_self.ledger == null) {
    return null;
  }

  return $DashboardLedgerStatsCopyWith<$Res>(_self.ledger!, (value) {
    return _then(_self.copyWith(ledger: value));
  });
}
}


/// @nodoc
mixin _$DashboardOverviewResponse {

 DashboardOverviewData? get data; String? get message; dynamic get errors;
/// Create a copy of DashboardOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardOverviewResponseCopyWith<DashboardOverviewResponse> get copyWith => _$DashboardOverviewResponseCopyWithImpl<DashboardOverviewResponse>(this as DashboardOverviewResponse, _$identity);

  /// Serializes this DashboardOverviewResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardOverviewResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardOverviewResponse&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.errors, _this.errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardOverviewResponse;
  return Object.hash(runtimeType,_this.data,_this.message,const DeepCollectionEquality().hash(_this.errors));
}

@override
String toString() {
  final _this = this as DashboardOverviewResponse;
  return 'DashboardOverviewResponse(data: ${_this.data}, message: ${_this.message}, errors: ${_this.errors})';
}


}

/// @nodoc
abstract mixin class $DashboardOverviewResponseCopyWith<$Res>  {
  factory $DashboardOverviewResponseCopyWith(DashboardOverviewResponse value, $Res Function(DashboardOverviewResponse) _then) = _$DashboardOverviewResponseCopyWithImpl;
@useResult
$Res call({
 DashboardOverviewData? data, String? message, dynamic errors
});


$DashboardOverviewDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$DashboardOverviewResponseCopyWithImpl<$Res>
    implements $DashboardOverviewResponseCopyWith<$Res> {
  _$DashboardOverviewResponseCopyWithImpl(this._self, this._then);

  final DashboardOverviewResponse _self;
  final $Res Function(DashboardOverviewResponse) _then;

/// Create a copy of DashboardOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(DashboardOverviewResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DashboardOverviewData?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of DashboardOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardOverviewDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DashboardOverviewDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardOverviewResponse].
extension DashboardOverviewResponsePatterns on DashboardOverviewResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardOverviewResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardOverviewResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardOverviewResponse value)  $default,){
final _that = this;
switch (_that) {
case _DashboardOverviewResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardOverviewResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardOverviewResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DashboardOverviewData? data,  String? message,  dynamic errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardOverviewResponse() when $default != null:
return $default(_that.data,_that.message,_that.errors);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DashboardOverviewData? data,  String? message,  dynamic errors)  $default,) {final _that = this;
switch (_that) {
case _DashboardOverviewResponse():
return $default(_that.data,_that.message,_that.errors);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DashboardOverviewData? data,  String? message,  dynamic errors)?  $default,) {final _that = this;
switch (_that) {
case _DashboardOverviewResponse() when $default != null:
return $default(_that.data,_that.message,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardOverviewResponse implements DashboardOverviewResponse {
  const _DashboardOverviewResponse({this.data, this.message, this.errors});
  factory _DashboardOverviewResponse.fromJson(Map<String, dynamic> json) => _$DashboardOverviewResponseFromJson(json);

@override final  DashboardOverviewData? data;
@override final  String? message;
@override final  dynamic errors;

/// Create a copy of DashboardOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardOverviewResponseCopyWith<_DashboardOverviewResponse> get copyWith => __$DashboardOverviewResponseCopyWithImpl<_DashboardOverviewResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardOverviewResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardOverviewResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,data,message,const DeepCollectionEquality().hash(errors));
}

@override
String toString() {
    return 'DashboardOverviewResponse(data: $data, message: $message, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$DashboardOverviewResponseCopyWith<$Res> implements $DashboardOverviewResponseCopyWith<$Res> {
  factory _$DashboardOverviewResponseCopyWith(_DashboardOverviewResponse value, $Res Function(_DashboardOverviewResponse) _then) = __$DashboardOverviewResponseCopyWithImpl;
@override @useResult
$Res call({
 DashboardOverviewData? data, String? message, dynamic errors
});


@override $DashboardOverviewDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$DashboardOverviewResponseCopyWithImpl<$Res>
    implements _$DashboardOverviewResponseCopyWith<$Res> {
  __$DashboardOverviewResponseCopyWithImpl(this._self, this._then);

  final _DashboardOverviewResponse _self;
  final $Res Function(_DashboardOverviewResponse) _then;

/// Create a copy of DashboardOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(_DashboardOverviewResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DashboardOverviewData?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of DashboardOverviewResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardOverviewDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DashboardOverviewDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$DashboardSalesStats {

@JsonKey(name: 'total_count') int get totalCount;@JsonKey(name: 'paid_total') double get paidTotal;@JsonKey(name: 'paid_profit') double get paidProfit;@JsonKey(name: 'paid_count') int get paidCount;@JsonKey(name: 'draft_count') int get draftCount;
/// Create a copy of DashboardSalesStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSalesStatsCopyWith<DashboardSalesStats> get copyWith => _$DashboardSalesStatsCopyWithImpl<DashboardSalesStats>(this as DashboardSalesStats, _$identity);

  /// Serializes this DashboardSalesStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardSalesStats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSalesStats&&(identical(other.totalCount, _this.totalCount) || other.totalCount == _this.totalCount)&&(identical(other.paidTotal, _this.paidTotal) || other.paidTotal == _this.paidTotal)&&(identical(other.paidProfit, _this.paidProfit) || other.paidProfit == _this.paidProfit)&&(identical(other.paidCount, _this.paidCount) || other.paidCount == _this.paidCount)&&(identical(other.draftCount, _this.draftCount) || other.draftCount == _this.draftCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardSalesStats;
  return Object.hash(runtimeType,_this.totalCount,_this.paidTotal,_this.paidProfit,_this.paidCount,_this.draftCount);
}

@override
String toString() {
  final _this = this as DashboardSalesStats;
  return 'DashboardSalesStats(totalCount: ${_this.totalCount}, paidTotal: ${_this.paidTotal}, paidProfit: ${_this.paidProfit}, paidCount: ${_this.paidCount}, draftCount: ${_this.draftCount})';
}


}

/// @nodoc
abstract mixin class $DashboardSalesStatsCopyWith<$Res>  {
  factory $DashboardSalesStatsCopyWith(DashboardSalesStats value, $Res Function(DashboardSalesStats) _then) = _$DashboardSalesStatsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'paid_total') double paidTotal,@JsonKey(name: 'paid_profit') double paidProfit,@JsonKey(name: 'paid_count') int paidCount,@JsonKey(name: 'draft_count') int draftCount
});




}
/// @nodoc
class _$DashboardSalesStatsCopyWithImpl<$Res>
    implements $DashboardSalesStatsCopyWith<$Res> {
  _$DashboardSalesStatsCopyWithImpl(this._self, this._then);

  final DashboardSalesStats _self;
  final $Res Function(DashboardSalesStats) _then;

/// Create a copy of DashboardSalesStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalCount = null,Object? paidTotal = null,Object? paidProfit = null,Object? paidCount = null,Object? draftCount = null,}) {
  return _then(DashboardSalesStats(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,paidTotal: null == paidTotal ? _self.paidTotal : paidTotal // ignore: cast_nullable_to_non_nullable
as double,paidProfit: null == paidProfit ? _self.paidProfit : paidProfit // ignore: cast_nullable_to_non_nullable
as double,paidCount: null == paidCount ? _self.paidCount : paidCount // ignore: cast_nullable_to_non_nullable
as int,draftCount: null == draftCount ? _self.draftCount : draftCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardSalesStats].
extension DashboardSalesStatsPatterns on DashboardSalesStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSalesStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSalesStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSalesStats value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSalesStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSalesStats value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSalesStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'paid_total')  double paidTotal, @JsonKey(name: 'paid_profit')  double paidProfit, @JsonKey(name: 'paid_count')  int paidCount, @JsonKey(name: 'draft_count')  int draftCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSalesStats() when $default != null:
return $default(_that.totalCount,_that.paidTotal,_that.paidProfit,_that.paidCount,_that.draftCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'paid_total')  double paidTotal, @JsonKey(name: 'paid_profit')  double paidProfit, @JsonKey(name: 'paid_count')  int paidCount, @JsonKey(name: 'draft_count')  int draftCount)  $default,) {final _that = this;
switch (_that) {
case _DashboardSalesStats():
return $default(_that.totalCount,_that.paidTotal,_that.paidProfit,_that.paidCount,_that.draftCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'paid_total')  double paidTotal, @JsonKey(name: 'paid_profit')  double paidProfit, @JsonKey(name: 'paid_count')  int paidCount, @JsonKey(name: 'draft_count')  int draftCount)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSalesStats() when $default != null:
return $default(_that.totalCount,_that.paidTotal,_that.paidProfit,_that.paidCount,_that.draftCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardSalesStats implements DashboardSalesStats {
  const _DashboardSalesStats({@JsonKey(name: 'total_count') this.totalCount = 0, @JsonKey(name: 'paid_total') this.paidTotal = 0, @JsonKey(name: 'paid_profit') this.paidProfit = 0, @JsonKey(name: 'paid_count') this.paidCount = 0, @JsonKey(name: 'draft_count') this.draftCount = 0});
  factory _DashboardSalesStats.fromJson(Map<String, dynamic> json) => _$DashboardSalesStatsFromJson(json);

@override@JsonKey(name: 'total_count') final  int totalCount;
@override@JsonKey(name: 'paid_total') final  double paidTotal;
@override@JsonKey(name: 'paid_profit') final  double paidProfit;
@override@JsonKey(name: 'paid_count') final  int paidCount;
@override@JsonKey(name: 'draft_count') final  int draftCount;

/// Create a copy of DashboardSalesStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSalesStatsCopyWith<_DashboardSalesStats> get copyWith => __$DashboardSalesStatsCopyWithImpl<_DashboardSalesStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardSalesStatsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSalesStats&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.paidTotal, paidTotal) || other.paidTotal == paidTotal)&&(identical(other.paidProfit, paidProfit) || other.paidProfit == paidProfit)&&(identical(other.paidCount, paidCount) || other.paidCount == paidCount)&&(identical(other.draftCount, draftCount) || other.draftCount == draftCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,totalCount,paidTotal,paidProfit,paidCount,draftCount);
}

@override
String toString() {
    return 'DashboardSalesStats(totalCount: $totalCount, paidTotal: $paidTotal, paidProfit: $paidProfit, paidCount: $paidCount, draftCount: $draftCount)';
}


}

/// @nodoc
abstract mixin class _$DashboardSalesStatsCopyWith<$Res> implements $DashboardSalesStatsCopyWith<$Res> {
  factory _$DashboardSalesStatsCopyWith(_DashboardSalesStats value, $Res Function(_DashboardSalesStats) _then) = __$DashboardSalesStatsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'paid_total') double paidTotal,@JsonKey(name: 'paid_profit') double paidProfit,@JsonKey(name: 'paid_count') int paidCount,@JsonKey(name: 'draft_count') int draftCount
});




}
/// @nodoc
class __$DashboardSalesStatsCopyWithImpl<$Res>
    implements _$DashboardSalesStatsCopyWith<$Res> {
  __$DashboardSalesStatsCopyWithImpl(this._self, this._then);

  final _DashboardSalesStats _self;
  final $Res Function(_DashboardSalesStats) _then;

/// Create a copy of DashboardSalesStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalCount = null,Object? paidTotal = null,Object? paidProfit = null,Object? paidCount = null,Object? draftCount = null,}) {
  return _then(_DashboardSalesStats(
totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,paidTotal: null == paidTotal ? _self.paidTotal : paidTotal // ignore: cast_nullable_to_non_nullable
as double,paidProfit: null == paidProfit ? _self.paidProfit : paidProfit // ignore: cast_nullable_to_non_nullable
as double,paidCount: null == paidCount ? _self.paidCount : paidCount // ignore: cast_nullable_to_non_nullable
as int,draftCount: null == draftCount ? _self.draftCount : draftCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
