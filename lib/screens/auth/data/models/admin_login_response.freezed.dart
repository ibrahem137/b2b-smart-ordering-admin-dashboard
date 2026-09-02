// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminLoginData {

 String get token;@JsonKey(name: 'token_type') String? get tokenType; AdminModel? get admin;
/// Create a copy of AdminLoginData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminLoginDataCopyWith<AdminLoginData> get copyWith => _$AdminLoginDataCopyWithImpl<AdminLoginData>(this as AdminLoginData, _$identity);

  /// Serializes this AdminLoginData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AdminLoginData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminLoginData&&(identical(other.token, _this.token) || other.token == _this.token)&&(identical(other.tokenType, _this.tokenType) || other.tokenType == _this.tokenType)&&(identical(other.admin, _this.admin) || other.admin == _this.admin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AdminLoginData;
  return Object.hash(runtimeType,_this.token,_this.tokenType,_this.admin);
}

@override
String toString() {
  final _this = this as AdminLoginData;
  return 'AdminLoginData(token: ${_this.token}, tokenType: ${_this.tokenType}, admin: ${_this.admin})';
}


}

/// @nodoc
abstract mixin class $AdminLoginDataCopyWith<$Res>  {
  factory $AdminLoginDataCopyWith(AdminLoginData value, $Res Function(AdminLoginData) _then) = _$AdminLoginDataCopyWithImpl;
@useResult
$Res call({
 String token,@JsonKey(name: 'token_type') String? tokenType, AdminModel? admin
});


$AdminModelCopyWith<$Res>? get admin;

}
/// @nodoc
class _$AdminLoginDataCopyWithImpl<$Res>
    implements $AdminLoginDataCopyWith<$Res> {
  _$AdminLoginDataCopyWithImpl(this._self, this._then);

  final AdminLoginData _self;
  final $Res Function(AdminLoginData) _then;

/// Create a copy of AdminLoginData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? tokenType = freezed,Object? admin = freezed,}) {
  return _then(AdminLoginData(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,admin: freezed == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as AdminModel?,
  ));
}
/// Create a copy of AdminLoginData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminModelCopyWith<$Res>? get admin {
    if (_self.admin == null) {
    return null;
  }

  return $AdminModelCopyWith<$Res>(_self.admin!, (value) {
    return _then(_self.copyWith(admin: value));
  });
}
}


/// Adds pattern-matching-related methods to [AdminLoginData].
extension AdminLoginDataPatterns on AdminLoginData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminLoginData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminLoginData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminLoginData value)  $default,){
final _that = this;
switch (_that) {
case _AdminLoginData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminLoginData value)?  $default,){
final _that = this;
switch (_that) {
case _AdminLoginData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'token_type')  String? tokenType,  AdminModel? admin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminLoginData() when $default != null:
return $default(_that.token,_that.tokenType,_that.admin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'token_type')  String? tokenType,  AdminModel? admin)  $default,) {final _that = this;
switch (_that) {
case _AdminLoginData():
return $default(_that.token,_that.tokenType,_that.admin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token, @JsonKey(name: 'token_type')  String? tokenType,  AdminModel? admin)?  $default,) {final _that = this;
switch (_that) {
case _AdminLoginData() when $default != null:
return $default(_that.token,_that.tokenType,_that.admin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminLoginData implements AdminLoginData {
  const _AdminLoginData({required this.token, @JsonKey(name: 'token_type') this.tokenType, this.admin});
  factory _AdminLoginData.fromJson(Map<String, dynamic> json) => _$AdminLoginDataFromJson(json);

@override final  String token;
@override@JsonKey(name: 'token_type') final  String? tokenType;
@override final  AdminModel? admin;

/// Create a copy of AdminLoginData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminLoginDataCopyWith<_AdminLoginData> get copyWith => __$AdminLoginDataCopyWithImpl<_AdminLoginData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminLoginDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminLoginData&&(identical(other.token, token) || other.token == token)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.admin, admin) || other.admin == admin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,token,tokenType,admin);
}

@override
String toString() {
    return 'AdminLoginData(token: $token, tokenType: $tokenType, admin: $admin)';
}


}

/// @nodoc
abstract mixin class _$AdminLoginDataCopyWith<$Res> implements $AdminLoginDataCopyWith<$Res> {
  factory _$AdminLoginDataCopyWith(_AdminLoginData value, $Res Function(_AdminLoginData) _then) = __$AdminLoginDataCopyWithImpl;
@override @useResult
$Res call({
 String token,@JsonKey(name: 'token_type') String? tokenType, AdminModel? admin
});


@override $AdminModelCopyWith<$Res>? get admin;

}
/// @nodoc
class __$AdminLoginDataCopyWithImpl<$Res>
    implements _$AdminLoginDataCopyWith<$Res> {
  __$AdminLoginDataCopyWithImpl(this._self, this._then);

  final _AdminLoginData _self;
  final $Res Function(_AdminLoginData) _then;

/// Create a copy of AdminLoginData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? tokenType = freezed,Object? admin = freezed,}) {
  return _then(_AdminLoginData(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,admin: freezed == admin ? _self.admin : admin // ignore: cast_nullable_to_non_nullable
as AdminModel?,
  ));
}

/// Create a copy of AdminLoginData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminModelCopyWith<$Res>? get admin {
    if (_self.admin == null) {
    return null;
  }

  return $AdminModelCopyWith<$Res>(_self.admin!, (value) {
    return _then(_self.copyWith(admin: value));
  });
}
}


/// @nodoc
mixin _$AdminLoginResponse {

 AdminLoginData? get data; String? get message; dynamic get errors;
/// Create a copy of AdminLoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminLoginResponseCopyWith<AdminLoginResponse> get copyWith => _$AdminLoginResponseCopyWithImpl<AdminLoginResponse>(this as AdminLoginResponse, _$identity);

  /// Serializes this AdminLoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AdminLoginResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminLoginResponse&&(identical(other.data, _this.data) || other.data == _this.data)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.errors, _this.errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AdminLoginResponse;
  return Object.hash(runtimeType,_this.data,_this.message,const DeepCollectionEquality().hash(_this.errors));
}

@override
String toString() {
  final _this = this as AdminLoginResponse;
  return 'AdminLoginResponse(data: ${_this.data}, message: ${_this.message}, errors: ${_this.errors})';
}


}

/// @nodoc
abstract mixin class $AdminLoginResponseCopyWith<$Res>  {
  factory $AdminLoginResponseCopyWith(AdminLoginResponse value, $Res Function(AdminLoginResponse) _then) = _$AdminLoginResponseCopyWithImpl;
@useResult
$Res call({
 AdminLoginData? data, String? message, dynamic errors
});


$AdminLoginDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$AdminLoginResponseCopyWithImpl<$Res>
    implements $AdminLoginResponseCopyWith<$Res> {
  _$AdminLoginResponseCopyWithImpl(this._self, this._then);

  final AdminLoginResponse _self;
  final $Res Function(AdminLoginResponse) _then;

/// Create a copy of AdminLoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(AdminLoginResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AdminLoginData?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of AdminLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminLoginDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AdminLoginDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AdminLoginResponse].
extension AdminLoginResponsePatterns on AdminLoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminLoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminLoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminLoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _AdminLoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminLoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AdminLoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AdminLoginData? data,  String? message,  dynamic errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminLoginResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AdminLoginData? data,  String? message,  dynamic errors)  $default,) {final _that = this;
switch (_that) {
case _AdminLoginResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AdminLoginData? data,  String? message,  dynamic errors)?  $default,) {final _that = this;
switch (_that) {
case _AdminLoginResponse() when $default != null:
return $default(_that.data,_that.message,_that.errors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminLoginResponse implements AdminLoginResponse {
  const _AdminLoginResponse({this.data, this.message, this.errors});
  factory _AdminLoginResponse.fromJson(Map<String, dynamic> json) => _$AdminLoginResponseFromJson(json);

@override final  AdminLoginData? data;
@override final  String? message;
@override final  dynamic errors;

/// Create a copy of AdminLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminLoginResponseCopyWith<_AdminLoginResponse> get copyWith => __$AdminLoginResponseCopyWithImpl<_AdminLoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminLoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminLoginResponse&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.errors, errors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,data,message,const DeepCollectionEquality().hash(errors));
}

@override
String toString() {
    return 'AdminLoginResponse(data: $data, message: $message, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$AdminLoginResponseCopyWith<$Res> implements $AdminLoginResponseCopyWith<$Res> {
  factory _$AdminLoginResponseCopyWith(_AdminLoginResponse value, $Res Function(_AdminLoginResponse) _then) = __$AdminLoginResponseCopyWithImpl;
@override @useResult
$Res call({
 AdminLoginData? data, String? message, dynamic errors
});


@override $AdminLoginDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$AdminLoginResponseCopyWithImpl<$Res>
    implements _$AdminLoginResponseCopyWith<$Res> {
  __$AdminLoginResponseCopyWithImpl(this._self, this._then);

  final _AdminLoginResponse _self;
  final $Res Function(_AdminLoginResponse) _then;

/// Create a copy of AdminLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? message = freezed,Object? errors = freezed,}) {
  return _then(_AdminLoginResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AdminLoginData?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of AdminLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminLoginDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AdminLoginDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$AdminModel {

 int get id; String get name; String get email;
/// Create a copy of AdminModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminModelCopyWith<AdminModel> get copyWith => _$AdminModelCopyWithImpl<AdminModel>(this as AdminModel, _$identity);

  /// Serializes this AdminModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AdminModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AdminModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.email);
}

@override
String toString() {
  final _this = this as AdminModel;
  return 'AdminModel(id: ${_this.id}, name: ${_this.name}, email: ${_this.email})';
}


}

/// @nodoc
abstract mixin class $AdminModelCopyWith<$Res>  {
  factory $AdminModelCopyWith(AdminModel value, $Res Function(AdminModel) _then) = _$AdminModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String email
});




}
/// @nodoc
class _$AdminModelCopyWithImpl<$Res>
    implements $AdminModelCopyWith<$Res> {
  _$AdminModelCopyWithImpl(this._self, this._then);

  final AdminModel _self;
  final $Res Function(AdminModel) _then;

/// Create a copy of AdminModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,}) {
  return _then(AdminModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminModel].
extension AdminModelPatterns on AdminModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminModel value)  $default,){
final _that = this;
switch (_that) {
case _AdminModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminModel value)?  $default,){
final _that = this;
switch (_that) {
case _AdminModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminModel() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String email)  $default,) {final _that = this;
switch (_that) {
case _AdminModel():
return $default(_that.id,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String email)?  $default,) {final _that = this;
switch (_that) {
case _AdminModel() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminModel implements AdminModel {
  const _AdminModel({required this.id, required this.name, required this.email});
  factory _AdminModel.fromJson(Map<String, dynamic> json) => _$AdminModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String email;

/// Create a copy of AdminModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminModelCopyWith<_AdminModel> get copyWith => __$AdminModelCopyWithImpl<_AdminModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,email);
}

@override
String toString() {
    return 'AdminModel(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$AdminModelCopyWith<$Res> implements $AdminModelCopyWith<$Res> {
  factory _$AdminModelCopyWith(_AdminModel value, $Res Function(_AdminModel) _then) = __$AdminModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String email
});




}
/// @nodoc
class __$AdminModelCopyWithImpl<$Res>
    implements _$AdminModelCopyWith<$Res> {
  __$AdminModelCopyWithImpl(this._self, this._then);

  final _AdminModel _self;
  final $Res Function(_AdminModel) _then;

/// Create a copy of AdminModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,}) {
  return _then(_AdminModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
