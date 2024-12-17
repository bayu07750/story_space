// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
      loginResult: json['loginResult'] == null
          ? null
          : LoginResultResponse.fromJson(
              json['loginResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'loginResult': instance.loginResult,
    };

_$LoginResultResponseImpl _$$LoginResultResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResultResponseImpl(
      userId: json['userId'] as String,
      name: json['name'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$LoginResultResponseImplToJson(
        _$LoginResultResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'token': instance.token,
    };
