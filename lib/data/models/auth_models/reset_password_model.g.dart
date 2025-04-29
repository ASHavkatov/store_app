// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResetPasswordModel _$ResetPasswordModelFromJson(Map<String, dynamic> json) =>
    _ResetPasswordModel(
      email: json['email'] as String,
      password: json['password'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$ResetPasswordModelToJson(_ResetPasswordModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'code': instance.code,
    };
