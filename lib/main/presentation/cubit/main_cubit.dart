import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:story_space/core/data/preferences/setting_preference.dart';
import 'package:story_space/core/data/preferences/user_prefenrece.dart';
import 'package:story_space/core/data/util/logger.dart';
import 'package:story_space/main/presentation/cubit/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.initial()) {
    _init();
  }

  _init() {
    validateSetting();
  }

  setDarkMode(bool value) async {
    await SettingPreference.setIsDarkMode(value);
    validateSetting();
  }

  setLanguage(String langaugeCode) async {
    await SettingPreference.setLanguageCode(langaugeCode);
    validateSetting();
  }

  validateSetting() async {
    emit(
      state.copyWith(
        setting: state.setting.copyWith(
          isDarkMode: await SettingPreference.getIsDarkMode(),
          locale: Locale(await SettingPreference.getLanguageCode()),
        ),
      ),
    );
  }

  getUser() async {
    Logger.log('getUser', prefix: 'MainCubit');
    emit(state.copyWith(user: await UserPrefenrece.getUser()));
  }

  logout() async {
    emit(state.copyWith(logoutState: state.logoutState.copyWith(isLoading: true)));
    // simulate network call
    final isSuccess = await Future.delayed(
      const Duration(seconds: 2),
      () async {
        return await UserPrefenrece.deleteUser();
      },
    );
    if (isSuccess) {
      Logger.log('logout: success');
      emit(
        state.copyWith(
          logoutState: state.logoutState.copyWith(
            isLoading: false,
            isError: false,
            isSuccess: true,
          ),
        ),
      );
    } else {
      Logger.log('logout: fail');
      emit(
        state.copyWith(
          logoutState: state.logoutState.copyWith(
            isLoading: false,
            isError: true,
            isSuccess: false,
          ),
        ),
      );
    }
  }
}
