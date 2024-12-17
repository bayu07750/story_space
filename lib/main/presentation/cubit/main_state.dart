// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_space/core/domain/model/setting.dart';
import 'package:story_space/core/domain/model/user.dart';
import 'package:story_space/main/presentation/cubit/logout_state.dart';

part 'main_state.freezed.dart';

@Freezed(
  toJson: false,
  fromJson: false,
)
class MainState with _$MainState {
  static MainState initial() => MainState(
        logoutState: LogoutState.initial(),
        setting: const Setting(
          isDarkMode: false,
          locale: Locale('en'),
        ),
      );

  const factory MainState({
    required LogoutState logoutState,
    required Setting setting,
    User? user,
  }) = _MainState;
}
