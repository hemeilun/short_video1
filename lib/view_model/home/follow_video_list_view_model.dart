
import 'package:flutter/material.dart';

import '../../entity/home/video_list_entity.dart';
import '../../network/base_entity.dart';
import '../../network/http_manager.dart';
import '../../ui/widgets/custom_refresh_mixin.dart';
import '../../utils/hud_util.dart';

class FollowVideoListViewModel extends ChangeNotifier  with CustomRefreshMixin {



  @override
  Future<List> requestList(int page) async {
    List tempL = [];
    Map<String, dynamic> params = {};
    params["size"] = 10;
    params["current"] = page;
    HudUtil.show();
    IBaseEntity? result = await HttpManager.getInstance().request(url: "/api/app/video/userAttentionList", params: params);
    HudUtil.dismiss();
    if (result?.isSuccess() == true) {
      VideoListEntity listResult = VideoListEntity.fromJson(result?.getData());
      List<VideoEntity>? temps = listResult.list;
      if (temps != null) {
        tempL.addAll(temps);
      }
      hasNext = listResult.hasNext ?? false;
    } else {
      HudUtil.toast(result?.getMsg() ?? "");
    }
    return tempL;
  }

  @override
  void onRequestComplete() {
    notifyListeners();
  }


  void follow(BuildContext context) {
    debugPrint("follow-------");
  }

  Future like(BuildContext context, VideoEntity entity) async {
    Map<String, dynamic> params = {};
    params["type"] = "";
    params["videoId"] = entity.id;
    HudUtil.show();
    IBaseEntity? result = await HttpManager.getInstance().request(url: "/api/app/video/likes", params: params);
    HudUtil.dismiss();
    if (result?.isSuccess() == true) {
      HudUtil.toast("ηΉθ΅ζε");
    } else {
      HudUtil.toast(result?.getMsg() ?? "");
    }
  }

  void comment(BuildContext context) {
    debugPrint("comment-------");
  }

  void forward(BuildContext context) {
    debugPrint("forward-------");
  }
}