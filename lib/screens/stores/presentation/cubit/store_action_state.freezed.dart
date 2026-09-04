// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_action_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreActionState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreActionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StoreActionState()';
}


}

/// @nodoc
class $StoreActionStateCopyWith<$Res>  {
$StoreActionStateCopyWith(StoreActionState _, $Res Function(StoreActionState) __);
}


/// Adds pattern-matching-related methods to [StoreActionState].
extension StoreActionStatePatterns on StoreActionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StoreActionFailure value)?  failure,TResult Function( StoreActionInitial value)?  initial,TResult Function( StoreActionLoading value)?  loading,TResult Function( StoreActionSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StoreActionFailure() when failure != null:
return failure(_that);case StoreActionInitial() when initial != null:
return initial(_that);case StoreActionLoading() when loading != null:
return loading(_that);case StoreActionSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StoreActionFailure value)  failure,required TResult Function( StoreActionInitial value)  initial,required TResult Function( StoreActionLoading value)  loading,required TResult Function( StoreActionSuccess value)  success,}){
final _that = this;
switch (_that) {
case StoreActionFailure():
return failure(_that);case StoreActionInitial():
return initial(_that);case StoreActionLoading():
return loading(_that);case StoreActionSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StoreActionFailure value)?  failure,TResult? Function( StoreActionInitial value)?  initial,TResult? Function( StoreActionLoading value)?  loading,TResult? Function( StoreActionSuccess value)?  success,}){
final _that = this;
switch (_that) {
case StoreActionFailure() when failure != null:
return failure(_that);case StoreActionInitial() when initial != null:
return initial(_that);case StoreActionLoading() when loading != null:
return loading(_that);case StoreActionSuccess() when success != null:
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
case StoreActionFailure() when failure != null:
return failure(_that.message);case StoreActionInitial() when initial != null:
return initial();case StoreActionLoading() when loading != null:
return loading();case StoreActionSuccess() when success != null:
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
case StoreActionFailure():
return failure(_that.message);case StoreActionInitial():
return initial();case StoreActionLoading():
return loading();case StoreActionSuccess():
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
case StoreActionFailure() when failure != null:
return failure(_that.message);case StoreActionInitial() when initial != null:
return initial();case StoreActionLoading() when loading != null:
return loading();case StoreActionSuccess() when success != null:
return success(_that.store);case _:
  return null;

}
}

}

/// @nodoc


class StoreActionFailure implements StoreActionState {
  const StoreActionFailure(this.message);
  

 final  String message;

/// Create a copy of StoreActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreActionFailureCopyWith<StoreActionFailure> get copyWith => _$StoreActionFailureCopyWithImpl<StoreActionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreActionFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'StoreActionState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $StoreActionFailureCopyWith<$Res> implements $StoreActionStateCopyWith<$Res> {
  factory $StoreActionFailureCopyWith(StoreActionFailure value, $Res Function(StoreActionFailure) _then) = _$StoreActionFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$StoreActionFailureCopyWithImpl<$Res>
    implements $StoreActionFailureCopyWith<$Res> {
  _$StoreActionFailureCopyWithImpl(this._self, this._then);

  final StoreActionFailure _self;
  final $Res Function(StoreActionFailure) _then;

/// Create a copy of StoreActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(StoreActionFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StoreActionInitial implements StoreActionState {
  const StoreActionInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreActionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StoreActionState.initial()';
}


}




/// @nodoc


class StoreActionLoading implements StoreActionState {
  const StoreActionLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreActionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'StoreActionState.loading()';
}


}




/// @nodoc


class StoreActionSuccess implements StoreActionState {
  const StoreActionSuccess(this.store);
  

 final  StoreModel store;

/// Create a copy of StoreActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreActionSuccessCopyWith<StoreActionSuccess> get copyWith => _$StoreActionSuccessCopyWithImpl<StoreActionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreActionSuccess&&(identical(other.store, store) || other.store == store));
}


@override
int get hashCode {
    return Object.hash(runtimeType,store);
}

@override
String toString() {
    return 'StoreActionState.success(store: $store)';
}


}

/// @nodoc
abstract mixin class $StoreActionSuccessCopyWith<$Res> implements $StoreActionStateCopyWith<$Res> {
  factory $StoreActionSuccessCopyWith(StoreActionSuccess value, $Res Function(StoreActionSuccess) _then) = _$StoreActionSuccessCopyWithImpl;
@useResult
$Res call({
 StoreModel store
});


$StoreModelCopyWith<$Res> get store;

}
/// @nodoc
class _$StoreActionSuccessCopyWithImpl<$Res>
    implements $StoreActionSuccessCopyWith<$Res> {
  _$StoreActionSuccessCopyWithImpl(this._self, this._then);

  final StoreActionSuccess _self;
  final $Res Function(StoreActionSuccess) _then;

/// Create a copy of StoreActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? store = null,}) {
  return _then(StoreActionSuccess(
null == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as StoreModel,
  ));
}

/// Create a copy of StoreActionState
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
