import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed()
class BaseResponse with _$BaseResponse {

  const factory BaseResponse({
    required bool error,
    required String message,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(Map<String, dynamic> map) => _$BaseResponseFromJson(map);

  static String toJsonString(BaseResponse response) => json.encode(response.toJson());

  factory BaseResponse.fromJsonString(String source) =>
      BaseResponse.fromJson(json.decode(source) as Map<String, dynamic>);
}
