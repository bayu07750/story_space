import 'package:story_space/core/data/network/model/login_response.dart';
import 'package:story_space/core/domain/model/user.dart';

extension UserMapper on LoginResultResponse {
  User get toDomain => User(
        id: userId,
        name: name,
        token: token,
      );
}
