// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stores_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoresState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoresState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StoresState()';
}


}

/// @nodoc
class $StoresStateCopyWith<$Res>  {
$StoresStateCopyWith(StoresState _, $Res Function(StoresState) __);
}


/// Adds pattern-matching-related methods to [StoresState].
extension StoresStatePatterns on StoresState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StoresFailure value)?  failure,TResult Function( StoresInitial value)?  initial,TResult Function( StoresLoading value)?  loading,TResult Function( StoresSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StoresFailure() when failure != null:
return failure(_that);case StoresInitial() when initial != null:
return initial(_that);case StoresLoading() when loading != null:
return loading(_that);case StoresSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StoresFailure value)  failure,required TResult Function( StoresInitial value)  initial,required TResult Function( StoresLoading value)  loading,required TResult Function( StoresSuccess value)  success,}){
final _that = this;
switch (_that) {
case StoresFailure():
return failure(_that);case StoresInitial():
return initial(_that);case StoresLoading():
return loading(_that);case StoresSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StoresFailure value)?  failure,TResult? Function( StoresInitial value)?  initial,TResult? Function( StoresLoading value)?  loading,TResult? Function( StoresSuccess value)?  success,}){
final _that = this;
switch (_that) {
case StoresFailure() when failure != null:
return failure(_that);case StoresInitial() when initial != null:
return initial(_that);case StoresLoading() when loading != null:
return loading(_that);case StoresSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  failure,TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<StoreModel> stores,  int total)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StoresFailure() when failure != null:
return failure(_that.message);case StoresInitial() when initial != null:
return initial();case StoresLoading() when loading != null:
return loading();case StoresSuccess() when success != null:
return success(_that.stores,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  failure,required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<StoreModel> stores,  int total)  success,}) {final _that = this;
switch (_that) {
case StoresFailure():
return failure(_that.message);case StoresInitial():
return initial();case StoresLoading():
return loading();case StoresSuccess():
return success(_that.stores,_that.total);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  failure,TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<StoreModel> stores,  int total)?  success,}) {final _that = this;
switch (_that) {
case StoresFailure() when failure != null:
return failure(_that.message);case StoresInitial() when initial != null:
return initial();case StoresLoading() when loading != null:
return loading();case StoresSuccess() when success != null:
return success(_that.stores,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class StoresFailure implements StoresState {
  const StoresFailure(this.message);
  

 final  String message;

/// Create a copy of StoresState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoresFailureCopyWith<StoresFailure> get copyWith => _$StoresFailureCopyWithImpl<StoresFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoresFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'StoresState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $StoresFailureCopyWith<$Res> implements $StoresStateCopyWith<$Res> {
  factory $StoresFailureCopyWith(StoresFailure value, $Res Function(StoresFailure) _then) = _$StoresFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$StoresFailureCopyWithImpl<$Res>
    implements $StoresFailureCopyWith<$Res> {
  _$StoresFailureCopyWithImpl(this._self, this._then);

  final StoresFailure _self;
  final $Res Function(StoresFailure) _then;

/// Create a copy of StoresState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(StoresFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StoresInitial implements StoresState {
  const StoresInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoresInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StoresState.initial()';
}


}




/// @nodoc


class StoresLoading implements StoresState {
  const StoresLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoresLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StoresState.loading()';
}


}




/// @nodoc


class StoresSuccess implements StoresState {
  const StoresSuccess({required  List<StoreModel> stores, required this.total}): _stores = stores;
  

 final  List<StoreModel> _stores;
 List<StoreModel> get stores {
  if (_stores is EqualUnmodifiableListView) return _stores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stores);
}

 final  int total;

/// Create a copy of StoresState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoresSuccessCopyWith<StoresSuccess> get copyWith => _$StoresSuccessCopyWithImpl<StoresSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoresSuccess&&const DeepCollectionEquality().equals(other.stores, _stores)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_stores),total);
}

@override
String toString() {
    return 'StoresState.success(stores: $stores, total: $total)';
}


}

/// @nodoc
abstract mixin class $StoresSuccessCopyWith<$Res> implements $StoresStateCopyWith<$Res> {
  factory $StoresSuccessCopyWith(StoresSuccess value, $Res Function(StoresSuccess) _then) = _$StoresSuccessCopyWithImpl;
@useResult
$Res call({
 List<StoreModel> stores, int total
});




}
/// @nodoc
class _$StoresSuccessCopyWithImpl<$Res>
    implements $StoresSuccessCopyWith<$Res> {
  _$StoresSuccessCopyWithImpl(this._self, this._then);

  final StoresSuccess _self;
  final $Res Function(StoresSuccess) _then;

/// Create a copy of StoresState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stores = null,Object? total = null,}) {
  return _then(StoresSuccess(
stores: null == stores ? _self._stores : stores // ignore: cast_nullable_to_non_nullable
as List<StoreModel>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
