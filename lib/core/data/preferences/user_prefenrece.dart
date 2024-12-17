import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_space/core/data/util/logger.dart';
import 'package:story_space/core/domain/model/user.dart';

class UserPrefenrece {
  static const _userKey = 'secureuserKey123';

  static Future<bool> saveUser(User user) async {
    final jsonString = jsonEncode(user.toJson());
    Logger.log(jsonString, prefix: 'UserPrefenrece.saveUser');
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(_userKey, jsonString);
  }

  static Future<User?> getUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final userJson = preferences.getString(_userKey);
    Logger.log(userJson ?? 'EMPTY', prefix: 'UserPrefenrece.getUser');
    if (userJson == null) {
      return null;
    }
    return User.fromJsonString(userJson);
  }

  static Future<bool> deleteUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    Logger.log('cleared', prefix: 'UserPrefenrece.deleteUser');
    return await preferences.clear();
  }
}
