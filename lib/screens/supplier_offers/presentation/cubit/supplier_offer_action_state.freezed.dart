// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_offer_action_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplierOfferActionState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOfferActionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SupplierOfferActionState()';
}


}

/// @nodoc
class $SupplierOfferActionStateCopyWith<$Res>  {
$SupplierOfferActionStateCopyWith(SupplierOfferActionState _, $Res Function(SupplierOfferActionState) __);
}


/// Adds pattern-matching-related methods to [SupplierOfferActionState].
extension SupplierOfferActionStatePatterns on SupplierOfferActionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SupplierOfferActionFailure value)?  failure,TResult Function( SupplierOfferActionInitial value)?  initial,TResult Function( SupplierOfferActionLoading value)?  loading,TResult Function( SupplierOfferActionSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SupplierOfferActionFailure() when failure != null:
return failure(_that);case SupplierOfferActionInitial() when initial != null:
return initial(_that);case SupplierOfferActionLoading() when loading != null:
return loading(_that);case SupplierOfferActionSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SupplierOfferActionFailure value)  failure,required TResult Function( SupplierOfferActionInitial value)  initial,required TResult Function( SupplierOfferActionLoading value)  loading,required TResult Function( SupplierOfferActionSuccess value)  success,}){
final _that = this;
switch (_that) {
case SupplierOfferActionFailure():
return failure(_that);case SupplierOfferActionInitial():
return initial(_that);case SupplierOfferActionLoading():
return loading(_that);case SupplierOfferActionSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SupplierOfferActionFailure value)?  failure,TResult? Function( SupplierOfferActionInitial value)?  initial,TResult? Function( SupplierOfferActionLoading value)?  loading,TResult? Function( SupplierOfferActionSuccess value)?  success,}){
final _that = this;
switch (_that) {
case SupplierOfferActionFailure() when failure != null:
return failure(_that);case SupplierOfferActionInitial() when initial != null:
return initial(_that);case SupplierOfferActionLoading() when loading != null:
return loading(_that);case SupplierOfferActionSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  failure,TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SupplierOfferActionFailure() when failure != null:
return failure(_that.message);case SupplierOfferActionInitial() when initial != null:
return initial();case SupplierOfferActionLoading() when loading != null:
return loading();case SupplierOfferActionSuccess() when success != null:
return success(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  failure,required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  success,}) {final _that = this;
switch (_that) {
case SupplierOfferActionFailure():
return failure(_that.message);case SupplierOfferActionInitial():
return initial();case SupplierOfferActionLoading():
return loading();case SupplierOfferActionSuccess():
return success(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  failure,TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  success,}) {final _that = this;
switch (_that) {
case SupplierOfferActionFailure() when failure != null:
return failure(_that.message);case SupplierOfferActionInitial() when initial != null:
return initial();case SupplierOfferActionLoading() when loading != null:
return loading();case SupplierOfferActionSuccess() when success != null:
return success(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SupplierOfferActionFailure implements SupplierOfferActionState {
  const SupplierOfferActionFailure(this.message);
  

 final  String message;

/// Create a copy of SupplierOfferActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierOfferActionFailureCopyWith<SupplierOfferActionFailure> get copyWith => _$SupplierOfferActionFailureCopyWithImpl<SupplierOfferActionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOfferActionFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SupplierOfferActionState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $SupplierOfferActionFailureCopyWith<$Res> implements $SupplierOfferActionStateCopyWith<$Res> {
  factory $SupplierOfferActionFailureCopyWith(SupplierOfferActionFailure value, $Res Function(SupplierOfferActionFailure) _then) = _$SupplierOfferActionFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SupplierOfferActionFailureCopyWithImpl<$Res>
    implements $SupplierOfferActionFailureCopyWith<$Res> {
  _$SupplierOfferActionFailureCopyWithImpl(this._self, this._then);

  final SupplierOfferActionFailure _self;
  final $Res Function(SupplierOfferActionFailure) _then;

/// Create a copy of SupplierOfferActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SupplierOfferActionFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SupplierOfferActionInitial implements SupplierOfferActionState {
  const SupplierOfferActionInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOfferActionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SupplierOfferActionState.initial()';
}


}




/// @nodoc


class SupplierOfferActionLoading implements SupplierOfferActionState {
  const SupplierOfferActionLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOfferActionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SupplierOfferActionState.loading()';
}


}




/// @nodoc


class SupplierOfferActionSuccess implements SupplierOfferActionState {
  const SupplierOfferActionSuccess(this.message);
  

 final  String message;

/// Create a copy of SupplierOfferActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierOfferActionSuccessCopyWith<SupplierOfferActionSuccess> get copyWith => _$SupplierOfferActionSuccessCopyWithImpl<SupplierOfferActionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierOfferActionSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'SupplierOfferActionState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $SupplierOfferActionSuccessCopyWith<$Res> implements $SupplierOfferActionStateCopyWith<$Res> {
  factory $SupplierOfferActionSuccessCopyWith(SupplierOfferActionSuccess value, $Res Function(SupplierOfferActionSuccess) _then) = _$SupplierOfferActionSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SupplierOfferActionSuccessCopyWithImpl<$Res>
    implements $SupplierOfferActionSuccessCopyWith<$Res> {
  _$SupplierOfferActionSuccessCopyWithImpl(this._self, this._then);

  final SupplierOfferActionSuccess _self;
  final $Res Function(SupplierOfferActionSuccess) _then;

/// Create a copy of SupplierOfferActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SupplierOfferActionSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
