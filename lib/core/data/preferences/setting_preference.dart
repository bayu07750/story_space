import 'package:shared_preferences/shared_preferences.dart';

class SettingPreference {
  static const String _darkModeKey = 'DarkModeKey';
  static const String _languageModeKey = "LanguageCodeKey";

  static Future<void> setIsDarkMode(bool value) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_darkModeKey, value);
  }

  static Future<bool> getIsDarkMode() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_darkModeKey) ?? false;
  }

  static Future<void> setLanguageCode(String code) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_languageModeKey, code);
  }

  static Future<String> getLanguageCode() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_languageModeKey) ?? 'en';
  }
}
