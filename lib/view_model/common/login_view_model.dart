import 'package:flutter/cupertino.dart';
import 'package:short_video/other/user_manager.dart';
import 'package:short_video/utils/hud_util.dart';

import '../../entity/user_entity.dart';
import '../../network/base_entity.dart';
import '../../network/http_manager.dart';
import '../../ui/pages/common/webview_page.dart';
import '../../ui/pages/main/main_page.dart';
import '../../utils/navigator_util.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  bool isAgree = false;
  bool isCanLogin = false;

  void close(BuildContext context) {
    NavigatorUtil.pop(context);
  }

  void agree() {
    isAgree = !isAgree;
    checkLogin();
    notifyListeners();
  }

  void userAgreement(BuildContext context) {
    NavigatorUtil.push(
        context, const WebViewPage(initialUrl: "https://www.baidu.com"));
  }

  void privacyPolicy(BuildContext context) {
    NavigatorUtil.push(
        context, const WebViewPage(initialUrl: "https://www.baidu.com"));
  }

  void checkLogin() {
    isCanLogin = phoneController.text.isNotEmpty && codeController.text.isNotEmpty && isAgree;
    notifyListeners();
  }

  void getCode(BuildContext context) {

  }

  void login(BuildContext context) async {
    Map<String, dynamic> params = {};
    params["phone"] = phoneController.text;
    params["smsCode"] = codeController.text;
    HudUtil.show();
    IBaseEntity? result = await HttpManager.getInstance().request(url: "/api/app/user/login", params: params);
    HudUtil.dismiss();
    if (result?.isSuccess() == true) {
      HudUtil.toast("登录成功");
      UserEntity entity = UserEntity.fromJson(result?.getData());
      await UserManager().saveUserInfo(entity);
      Navigator.pushAndRemoveUntil(context,
          CupertinoPageRoute(builder: (_) => const MainPage()), (route) => false);
    } else {
      HudUtil.toast(result?.getMsg() ?? "");
    }
  }
}
