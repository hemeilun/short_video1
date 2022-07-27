import 'dart:convert';

import '../entity/user_entity.dart';
import '../ui/pages/common/login_page.dart';
import '../utils/navigator_util.dart';
import '../utils/sharepreferences_util.dart';
import 'global.dart';

class UserManager {

  static UserEntity? userEntity;
  factory UserManager() => _instance;
  static final UserManager _instance = UserManager._();
  UserManager._() {
    _init();
  }

  void _init() async {
    final userString = await SharedPreferencesUtil.getString("user");
    if (userString != null) {
      UserManager.userEntity = UserEntity.fromJson(jsonDecode(userString));
    }
  }

  Future saveUserInfo(UserEntity entity) async {
    userEntity = entity;
    await SharedPreferencesUtil.setData("user", jsonEncode(userEntity?.toJson()));
    await SharedPreferencesUtil.setData("token", userEntity?.token);
  }

  Future<String?> getToken() async {
    return await SharedPreferencesUtil.getString("token");
  }

  Future clearUserInfo() async {
    await SharedPreferencesUtil.removeAllData();
  }
}