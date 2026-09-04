// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_offers_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplierOffersState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOffersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SupplierOffersState()';
}


}

/// @nodoc
class $SupplierOffersStateCopyWith<$Res>  {
$SupplierOffersStateCopyWith(SupplierOffersState _, $Res Function(SupplierOffersState) __);
}


/// Adds pattern-matching-related methods to [SupplierOffersState].
extension SupplierOffersStatePatterns on SupplierOffersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SupplierOffersFailure value)?  failure,TResult Function( SupplierOffersInitial value)?  initial,TResult Function( SupplierOffersLoading value)?  loading,TResult Function( SupplierOffersSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SupplierOffersFailure() when failure != null:
return failure(_that);case SupplierOffersInitial() when initial != null:
return initial(_that);case SupplierOffersLoading() when loading != null:
return loading(_that);case SupplierOffersSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SupplierOffersFailure value)  failure,required TResult Function( SupplierOffersInitial value)  initial,required TResult Function( SupplierOffersLoading value)  loading,required TResult Function( SupplierOffersSuccess value)  success,}){
final _that = this;
switch (_that) {
case SupplierOffersFailure():
return failure(_that);case SupplierOffersInitial():
return initial(_that);case SupplierOffersLoading():
return loading(_that);case SupplierOffersSuccess():
return success(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SupplierOffersFailure value)?  failure,TResult? Function( SupplierOffersInitial value)?  initial,TResult? Function( SupplierOffersLoading value)?  loading,TResult? Function( SupplierOffersSuccess value)?  success,}){
final _that = this;
switch (_that) {
case SupplierOffersFailure() when failure != null:
return failure(_that);case SupplierOffersInitial() when initial != null:
return initial(_that);case SupplierOffersLoading() when loading != null:
return loading(_that);case SupplierOffersSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  failure,TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<SupplierOfferModel> offers)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SupplierOffersFailure() when failure != null:
return failure(_that.message);case SupplierOffersInitial() when initial != null:
return initial();case SupplierOffersLoading() when loading != null:
return loading();case SupplierOffersSuccess() when success != null:
return success(_that.offers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  failure,required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<SupplierOfferModel> offers)  success,}) {final _that = this;
switch (_that) {
case SupplierOffersFailure():
return failure(_that.message);case SupplierOffersInitial():
return initial();case SupplierOffersLoading():
return loading();case SupplierOffersSuccess():
return success(_that.offers);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  failure,TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<SupplierOfferModel> offers)?  success,}) {final _that = this;
switch (_that) {
case SupplierOffersFailure() when failure != null:
return failure(_that.message);case SupplierOffersInitial() when initial != null:
return initial();case SupplierOffersLoading() when loading != null:
return loading();case SupplierOffersSuccess() when success != null:
return success(_that.offers);case _:
  return null;

}
}

}

/// @nodoc


class SupplierOffersFailure implements SupplierOffersState {
  const SupplierOffersFailure(this.message);
  

 final  String message;

/// Create a copy of SupplierOffersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierOffersFailureCopyWith<SupplierOffersFailure> get copyWith => _$SupplierOffersFailureCopyWithImpl<SupplierOffersFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOffersFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SupplierOffersState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $SupplierOffersFailureCopyWith<$Res> implements $SupplierOffersStateCopyWith<$Res> {
  factory $SupplierOffersFailureCopyWith(SupplierOffersFailure value, $Res Function(SupplierOffersFailure) _then) = _$SupplierOffersFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SupplierOffersFailureCopyWithImpl<$Res>
    implements $SupplierOffersFailureCopyWith<$Res> {
  _$SupplierOffersFailureCopyWithImpl(this._self, this._then);

  final SupplierOffersFailure _self;
  final $Res Function(SupplierOffersFailure) _then;

/// Create a copy of SupplierOffersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SupplierOffersFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SupplierOffersInitial implements SupplierOffersState {
  const SupplierOffersInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOffersInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SupplierOffersState.initial()';
}


}




/// @nodoc


class SupplierOffersLoading implements SupplierOffersState {
  const SupplierOffersLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOffersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SupplierOffersState.loading()';
}


}




/// @nodoc


class SupplierOffersSuccess implements SupplierOffersState {
  const SupplierOffersSuccess( List<SupplierOfferModel> offers): _offers = offers;
  

 final  List<SupplierOfferModel> _offers;
 List<SupplierOfferModel> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}


/// Create a copy of SupplierOffersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierOffersSuccessCopyWith<SupplierOffersSuccess> get copyWith => _$SupplierOffersSuccessCopyWithImpl<SupplierOffersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOffersSuccess&&const DeepCollectionEquality().equals(other.offers, _offers));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_offers));
}

@override
String toString() {
    return 'SupplierOffersState.success(offers: $offers)';
}


}

/// @nodoc
abstract mixin class $SupplierOffersSuccessCopyWith<$Res> implements $SupplierOffersStateCopyWith<$Res> {
  factory $SupplierOffersSuccessCopyWith(SupplierOffersSuccess value, $Res Function(SupplierOffersSuccess) _then) = _$SupplierOffersSuccessCopyWithImpl;
@useResult
$Res call({
 List<SupplierOfferModel> offers
});




}
/// @nodoc
class _$SupplierOffersSuccessCopyWithImpl<$Res>
    implements $SupplierOffersSuccessCopyWith<$Res> {
  _$SupplierOffersSuccessCopyWithImpl(this._self, this._then);

  final SupplierOffersSuccess _self;
  final $Res Function(SupplierOffersSuccess) _then;

/// Create a copy of SupplierOffersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offers = null,}) {
  return _then(SupplierOffersSuccess(
null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<SupplierOfferModel>,
  ));
}


}

// dart format on
