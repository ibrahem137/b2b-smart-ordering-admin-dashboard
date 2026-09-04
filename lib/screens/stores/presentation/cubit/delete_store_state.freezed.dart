// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_store_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeleteStoreState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteStoreState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DeleteStoreState()';
}


}

/// @nodoc
class $DeleteStoreStateCopyWith<$Res>  {
$DeleteStoreStateCopyWith(DeleteStoreState _, $Res Function(DeleteStoreState) __);
}


/// Adds pattern-matching-related methods to [DeleteStoreState].
extension DeleteStoreStatePatterns on DeleteStoreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeleteStoreFailure value)?  failure,TResult Function( DeleteStoreInitial value)?  initial,TResult Function( DeleteStoreLoading value)?  loading,TResult Function( DeleteStoreSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeleteStoreFailure() when failure != null:
return failure(_that);case DeleteStoreInitial() when initial != null:
return initial(_that);case DeleteStoreLoading() when loading != null:
return loading(_that);case DeleteStoreSuccess() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeleteStoreFailure value)  failure,required TResult Function( DeleteStoreInitial value)  initial,required TResult Function( DeleteStoreLoading value)  loading,required TResult Function( DeleteStoreSuccess value)  success,}){
final _that = this;
switch (_that) {
case DeleteStoreFailure():
return failure(_that);case DeleteStoreInitial():
return initial(_that);case DeleteStoreLoading():
return loading(_that);case DeleteStoreSuccess():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeleteStoreFailure value)?  failure,TResult? Function( DeleteStoreInitial value)?  initial,TResult? Function( DeleteStoreLoading value)?  loading,TResult? Function( DeleteStoreSuccess value)?  success,}){
final _that = this;
switch (_that) {
case DeleteStoreFailure() when failure != null:
return failure(_that);case DeleteStoreInitial() when initial != null:
return initial(_that);case DeleteStoreLoading() when loading != null:
return loading(_that);case DeleteStoreSuccess() when success != null:
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
case DeleteStoreFailure() when failure != null:
return failure(_that.message);case DeleteStoreInitial() when initial != null:
return initial();case DeleteStoreLoading() when loading != null:
return loading();case DeleteStoreSuccess() when success != null:
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
case DeleteStoreFailure():
return failure(_that.message);case DeleteStoreInitial():
return initial();case DeleteStoreLoading():
return loading();case DeleteStoreSuccess():
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
case DeleteStoreFailure() when failure != null:
return failure(_that.message);case DeleteStoreInitial() when initial != null:
return initial();case DeleteStoreLoading() when loading != null:
return loading();case DeleteStoreSuccess() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class DeleteStoreFailure implements DeleteStoreState {
  const DeleteStoreFailure(this.message);
  

 final  String message;

/// Create a copy of DeleteStoreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteStoreFailureCopyWith<DeleteStoreFailure> get copyWith => _$DeleteStoreFailureCopyWithImpl<DeleteStoreFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteStoreFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'DeleteStoreState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $DeleteStoreFailureCopyWith<$Res> implements $DeleteStoreStateCopyWith<$Res> {
  factory $DeleteStoreFailureCopyWith(DeleteStoreFailure value, $Res Function(DeleteStoreFailure) _then) = _$DeleteStoreFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DeleteStoreFailureCopyWithImpl<$Res>
    implements $DeleteStoreFailureCopyWith<$Res> {
  _$DeleteStoreFailureCopyWithImpl(this._self, this._then);

  final DeleteStoreFailure _self;
  final $Res Function(DeleteStoreFailure) _then;

/// Create a copy of DeleteStoreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DeleteStoreFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteStoreInitial implements DeleteStoreState {
  const DeleteStoreInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteStoreInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DeleteStoreState.initial()';
}


}




/// @nodoc


class DeleteStoreLoading implements DeleteStoreState {
  const DeleteStoreLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteStoreLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DeleteStoreState.loading()';
}


}




/// @nodoc


class DeleteStoreSuccess implements DeleteStoreState {
  const DeleteStoreSuccess();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteStoreSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DeleteStoreState.success()';
}


}




// dart format on
