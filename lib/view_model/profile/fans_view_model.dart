
import 'package:flutter/material.dart';

import '../../network/base_entity.dart';
import '../../network/http_manager.dart';
import '../../ui/widgets/custom_refresh_mixin.dart';
import '../../utils/hud_util.dart';

class FansViewModel extends ChangeNotifier  with CustomRefreshMixin {

  void follow(BuildContext context) {
    debugPrint("follow-------");
  }

  void unfollow(BuildContext context) {
    debugPrint("unfollow-------");
  }

  @override
  Future<List> requestList(int page) async {
    List tempL = [];
    Map<String, dynamic> params = {};
    params["size"] = 10;
    params["current"] = page;
    // HudUtil.show();
    IBaseEntity? result = await HttpManager.getInstance().request(url: "/api/admin/app/user/fansList", params: params);
    // HudUtil.dismiss();
    return tempL;
  }

  @override
  void onRequestComplete() {
    notifyListeners();
  }
}