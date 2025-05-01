// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetPasswordModel {

 String get email; String get password; String get code;
/// Create a copy of ResetPasswordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordModelCopyWith<ResetPasswordModel> get copyWith => _$ResetPasswordModelCopyWithImpl<ResetPasswordModel>(this as ResetPasswordModel, _$identity);

  /// Serializes this ResetPasswordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,code);

@override
String toString() {
  return 'ResetPasswordModel(email: $email, password: $password, code: $code)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordModelCopyWith<$Res>  {
  factory $ResetPasswordModelCopyWith(ResetPasswordModel value, $Res Function(ResetPasswordModel) _then) = _$ResetPasswordModelCopyWithImpl;
@useResult
$Res call({
 String email, String password, String code
});




}
/// @nodoc
class _$ResetPasswordModelCopyWithImpl<$Res>
    implements $ResetPasswordModelCopyWith<$Res> {
  _$ResetPasswordModelCopyWithImpl(this._self, this._then);

  final ResetPasswordModel _self;
  final $Res Function(ResetPasswordModel) _then;

/// Create a copy of ResetPasswordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? code = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ResetPasswordModel implements ResetPasswordModel {
  const _ResetPasswordModel({required this.email, required this.password, required this.code});
  factory _ResetPasswordModel.fromJson(Map<String, dynamic> json) => _$ResetPasswordModelFromJson(json);

@override final  String email;
@override final  String password;
@override final  String code;

/// Create a copy of ResetPasswordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordModelCopyWith<_ResetPasswordModel> get copyWith => __$ResetPasswordModelCopyWithImpl<_ResetPasswordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPasswordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.code, code) || other.code == code));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,code);

@override
String toString() {
  return 'ResetPasswordModel(email: $email, password: $password, code: $code)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordModelCopyWith<$Res> implements $ResetPasswordModelCopyWith<$Res> {
  factory _$ResetPasswordModelCopyWith(_ResetPasswordModel value, $Res Function(_ResetPasswordModel) _then) = __$ResetPasswordModelCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String code
});




}
/// @nodoc
class __$ResetPasswordModelCopyWithImpl<$Res>
    implements _$ResetPasswordModelCopyWith<$Res> {
  __$ResetPasswordModelCopyWithImpl(this._self, this._then);

  final _ResetPasswordModel _self;
  final $Res Function(_ResetPasswordModel) _then;

/// Create a copy of ResetPasswordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? code = null,}) {
  return _then(_ResetPasswordModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
