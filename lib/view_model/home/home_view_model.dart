
import 'package:flutter/material.dart';
import 'package:short_video/ui/pages/common/login_page.dart';

import '../../network/base_entity.dart';
import '../../network/http_manager.dart';
import '../../utils/hud_util.dart';
import '../../utils/navigator_util.dart';

class HomeViewModel extends ChangeNotifier {
  List<String> tabs = ["推荐", "关注"];
  TabController? tabController;
  int currentIndex = 0;

  HomeViewModel({required TickerProvider vsync}) {
    tabController = TabController(initialIndex: currentIndex, length: tabs.length, vsync: vsync);
  }

  // void follow(BuildContext context) {
  //   debugPrint("follow-------");
  // }
  //
  // Future like(BuildContext context) async {
  //   Map<String, dynamic> params = {};
  //   params["type"] = "";
  //   params["videoId"] = "";
  //   HudUtil.show();
  //   IBaseEntity? result = await HttpManager.getInstance().request(url: "/api/app/video/likes", params: params);
  //   HudUtil.dismiss();
  //   if (result?.isSuccess() == true) {
  //
  //   } else {
  //     HudUtil.toast(result?.getMsg() ?? "");
  //   }
  // }
  //
  // void comment(BuildContext context) {
  //   debugPrint("comment-------");
  // }
  //
  // void forward(BuildContext context) {
  //   debugPrint("forward-------");
  // }
}