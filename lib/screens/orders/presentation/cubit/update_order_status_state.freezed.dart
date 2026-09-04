// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_order_status_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateOrderStatusState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateOrderStatusState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'UpdateOrderStatusState()';
}


}

/// @nodoc
class $UpdateOrderStatusStateCopyWith<$Res>  {
$UpdateOrderStatusStateCopyWith(UpdateOrderStatusState _, $Res Function(UpdateOrderStatusState) __);
}


/// Adds pattern-matching-related methods to [UpdateOrderStatusState].
extension UpdateOrderStatusStatePatterns on UpdateOrderStatusState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UpdateOrderStatusFailure value)?  failure,TResult Function( UpdateOrderStatusInitial value)?  initial,TResult Function( UpdateOrderStatusLoading value)?  loading,TResult Function( UpdateOrderStatusSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UpdateOrderStatusFailure() when failure != null:
return failure(_that);case UpdateOrderStatusInitial() when initial != null:
return initial(_that);case UpdateOrderStatusLoading() when loading != null:
return loading(_that);case UpdateOrderStatusSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UpdateOrderStatusFailure value)  failure,required TResult Function( UpdateOrderStatusInitial value)  initial,required TResult Function( UpdateOrderStatusLoading value)  loading,required TResult Function( UpdateOrderStatusSuccess value)  success,}){
final _that = this;
switch (_that) {
case UpdateOrderStatusFailure():
return failure(_that);case UpdateOrderStatusInitial():
return initial(_that);case UpdateOrderStatusLoading():
return loading(_that);case UpdateOrderStatusSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UpdateOrderStatusFailure value)?  failure,TResult? Function( UpdateOrderStatusInitial value)?  initial,TResult? Function( UpdateOrderStatusLoading value)?  loading,TResult? Function( UpdateOrderStatusSuccess value)?  success,}){
final _that = this;
switch (_that) {
case UpdateOrderStatusFailure() when failure != null:
return failure(_that);case UpdateOrderStatusInitial() when initial != null:
return initial(_that);case UpdateOrderStatusLoading() when loading != null:
return loading(_that);case UpdateOrderStatusSuccess() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  failure,TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UpdateOrderStatusFailure() when failure != null:
return failure(_that.message);case UpdateOrderStatusInitial() when initial != null:
return initial();case UpdateOrderStatusLoading() when loading != null:
return loading();case UpdateOrderStatusSuccess() when success != null:
return success();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  failure,required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case UpdateOrderStatusFailure():
return failure(_that.message);case UpdateOrderStatusInitial():
return initial();case UpdateOrderStatusLoading():
return loading();case UpdateOrderStatusSuccess():
return success();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  failure,TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case UpdateOrderStatusFailure() when failure != null:
return failure(_that.message);case UpdateOrderStatusInitial() when initial != null:
return initial();case UpdateOrderStatusLoading() when loading != null:
return loading();case UpdateOrderStatusSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class UpdateOrderStatusFailure implements UpdateOrderStatusState {
  const UpdateOrderStatusFailure(this.message);
  

 final  String message;

/// Create a copy of UpdateOrderStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateOrderStatusFailureCopyWith<UpdateOrderStatusFailure> get copyWith => _$UpdateOrderStatusFailureCopyWithImpl<UpdateOrderStatusFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateOrderStatusFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'UpdateOrderStatusState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $UpdateOrderStatusFailureCopyWith<$Res> implements $UpdateOrderStatusStateCopyWith<$Res> {
  factory $UpdateOrderStatusFailureCopyWith(UpdateOrderStatusFailure value, $Res Function(UpdateOrderStatusFailure) _then) = _$UpdateOrderStatusFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UpdateOrderStatusFailureCopyWithImpl<$Res>
    implements $UpdateOrderStatusFailureCopyWith<$Res> {
  _$UpdateOrderStatusFailureCopyWithImpl(this._self, this._then);

  final UpdateOrderStatusFailure _self;
  final $Res Function(UpdateOrderStatusFailure) _then;

/// Create a copy of UpdateOrderStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UpdateOrderStatusFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateOrderStatusInitial implements UpdateOrderStatusState {
  const UpdateOrderStatusInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateOrderStatusInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'UpdateOrderStatusState.initial()';
}


}




/// @nodoc


class UpdateOrderStatusLoading implements UpdateOrderStatusState {
  const UpdateOrderStatusLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateOrderStatusLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'UpdateOrderStatusState.loading()';
}


}




/// @nodoc


class UpdateOrderStatusSuccess implements UpdateOrderStatusState {
  const UpdateOrderStatusSuccess();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateOrderStatusSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'UpdateOrderStatusState.success()';
}


}




// dart format on
