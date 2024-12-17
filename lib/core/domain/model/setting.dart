// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class Setting with _$Setting {
  const factory Setting({
    required bool isDarkMode,
    required Locale locale,
  }) = _Setting;
}
