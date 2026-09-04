// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreDetailsState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StoreDetailsState()';
}


}

/// @nodoc
class $StoreDetailsStateCopyWith<$Res>  {
$StoreDetailsStateCopyWith(StoreDetailsState _, $Res Function(StoreDetailsState) __);
}


/// Adds pattern-matching-related methods to [StoreDetailsState].
extension StoreDetailsStatePatterns on StoreDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StoreDetailsFailure value)?  failure,TResult Function( StoreDetailsInitial value)?  initial,TResult Function( StoreDetailsLoading value)?  loading,TResult Function( StoreDetailsSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StoreDetailsFailure() when failure != null:
return failure(_that);case StoreDetailsInitial() when initial != null:
return initial(_that);case StoreDetailsLoading() when loading != null:
return loading(_that);case StoreDetailsSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StoreDetailsFailure value)  failure,required TResult Function( StoreDetailsInitial value)  initial,required TResult Function( StoreDetailsLoading value)  loading,required TResult Function( StoreDetailsSuccess value)  success,}){
final _that = this;
switch (_that) {
case StoreDetailsFailure():
return failure(_that);case StoreDetailsInitial():
return initial(_that);case StoreDetailsLoading():
return loading(_that);case StoreDetailsSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StoreDetailsFailure value)?  failure,TResult? Function( StoreDetailsInitial value)?  initial,TResult? Function( StoreDetailsLoading value)?  loading,TResult? Function( StoreDetailsSuccess value)?  success,}){
final _that = this;
switch (_that) {
case StoreDetailsFailure() when failure != null:
return failure(_that);case StoreDetailsInitial() when initial != null:
return initial(_that);case StoreDetailsLoading() when loading != null:
return loading(_that);case StoreDetailsSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  failure,TResult Function()?  initial,TResult Function()?  loading,TResult Function( StoreModel store)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StoreDetailsFailure() when failure != null:
return failure(_that.message);case StoreDetailsInitial() when initial != null:
return initial();case StoreDetailsLoading() when loading != null:
return loading();case StoreDetailsSuccess() when success != null:
return success(_that.store);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  failure,required TResult Function()  initial,required TResult Function()  loading,required TResult Function( StoreModel store)  success,}) {final _that = this;
switch (_that) {
case StoreDetailsFailure():
return failure(_that.message);case StoreDetailsInitial():
return initial();case StoreDetailsLoading():
return loading();case StoreDetailsSuccess():
return success(_that.store);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  failure,TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( StoreModel store)?  success,}) {final _that = this;
switch (_that) {
case StoreDetailsFailure() when failure != null:
return failure(_that.message);case StoreDetailsInitial() when initial != null:
return initial();case StoreDetailsLoading() when loading != null:
return loading();case StoreDetailsSuccess() when success != null:
return success(_that.store);case _:
  return null;

}
}

}

/// @nodoc


class StoreDetailsFailure implements StoreDetailsState {
  const StoreDetailsFailure(this.message);
  

 final  String message;

/// Create a copy of StoreDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreDetailsFailureCopyWith<StoreDetailsFailure> get copyWith => _$StoreDetailsFailureCopyWithImpl<StoreDetailsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDetailsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'StoreDetailsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $StoreDetailsFailureCopyWith<$Res> implements $StoreDetailsStateCopyWith<$Res> {
  factory $StoreDetailsFailureCopyWith(StoreDetailsFailure value, $Res Function(StoreDetailsFailure) _then) = _$StoreDetailsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$StoreDetailsFailureCopyWithImpl<$Res>
    implements $StoreDetailsFailureCopyWith<$Res> {
  _$StoreDetailsFailureCopyWithImpl(this._self, this._then);

  final StoreDetailsFailure _self;
  final $Res Function(StoreDetailsFailure) _then;

/// Create a copy of StoreDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(StoreDetailsFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StoreDetailsInitial implements StoreDetailsState {
  const StoreDetailsInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDetailsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StoreDetailsState.initial()';
}


}




/// @nodoc


class StoreDetailsLoading implements StoreDetailsState {
  const StoreDetailsLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StoreDetailsState.loading()';
}


}




/// @nodoc


class StoreDetailsSuccess implements StoreDetailsState {
  const StoreDetailsSuccess(this.store);
  

 final  StoreModel store;

/// Create a copy of StoreDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreDetailsSuccessCopyWith<StoreDetailsSuccess> get copyWith => _$StoreDetailsSuccessCopyWithImpl<StoreDetailsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDetailsSuccess&&(identical(other.store, store) || other.store == store));
}


@override
int get hashCode {
    return Object.hash(runtimeType,store);
}

@override
String toString() {
    return 'StoreDetailsState.success(store: $store)';
}


}

/// @nodoc
abstract mixin class $StoreDetailsSuccessCopyWith<$Res> implements $StoreDetailsStateCopyWith<$Res> {
  factory $StoreDetailsSuccessCopyWith(StoreDetailsSuccess value, $Res Function(StoreDetailsSuccess) _then) = _$StoreDetailsSuccessCopyWithImpl;
@useResult
$Res call({
 StoreModel store
});


$StoreModelCopyWith<$Res> get store;

}
/// @nodoc
class _$StoreDetailsSuccessCopyWithImpl<$Res>
    implements $StoreDetailsSuccessCopyWith<$Res> {
  _$StoreDetailsSuccessCopyWithImpl(this._self, this._then);

  final StoreDetailsSuccess _self;
  final $Res Function(StoreDetailsSuccess) _then;

/// Create a copy of StoreDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? store = null,}) {
  return _then(StoreDetailsSuccess(
null == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as StoreModel,
  ));
}

/// Create a copy of StoreDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreModelCopyWith<$Res> get store {
  
  return $StoreModelCopyWith<$Res>(_self.store, (value) {
    return _then(_self.copyWith(store: value));
  });
}
}

// dart format on
