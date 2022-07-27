import 'package:flutter/material.dart';
import 'package:short_video/other/user_manager.dart';

import '../../other/global.dart';
import '../../utils/navigator_util.dart';
import '../pages/common/login_page.dart';

class CustomGesture extends StatelessWidget {
  final Widget? child;
  final HitTestBehavior? behavior;
  final GestureTapCallback? onTap;

  const CustomGesture(
      {Key? key,
      this.child,
      this.behavior = HitTestBehavior.opaque,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      behavior: behavior,
      onTap: () async {
        String? token = await UserManager().getToken();
        debugPrint("CustomGesture_token----$token");
        if (token == null || token.isEmpty) {
          NavigatorUtil.push(
              Global.navigatorKey.currentState!.context, const LoginPage());
        } else {
          onTap?.call();
        }
      },
    );
  }
}
