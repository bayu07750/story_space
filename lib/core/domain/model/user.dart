import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);

  factory User.fromJsonString(String source) => User.fromJson(json.decode(source) as Map<String, dynamic>);
}
