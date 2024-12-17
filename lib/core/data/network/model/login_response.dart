import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@Freezed()
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required bool error,
    required String message,
    LoginResultResponse? loginResult,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> map) => _$LoginResponseFromJson(map);

  static String toJsonString(LoginResponse loginResponse) => json.encode(loginResponse.toJson());

  factory LoginResponse.fromJsonString(String source) =>
      LoginResponse.fromJson(json.decode(source) as Map<String, dynamic>);
}

@Freezed()
class LoginResultResponse with _$LoginResultResponse {
  const factory LoginResultResponse({
    required String userId,
    required String name,
    required String token,
  }) = _LoginResultResponse;

  factory LoginResultResponse.fromJson(Map<String, dynamic> map) => _$LoginResultResponseFromJson(map);

  static String toJsonString(LoginResultResponse response) => json.encode(response.toJson());

  factory LoginResultResponse.fromJsonString(String source) =>
      LoginResultResponse.fromJson(json.decode(source) as Map<String, dynamic>);
}
