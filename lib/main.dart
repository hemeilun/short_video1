import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:short_video/other/global.dart';
import 'package:short_video/ui/pages/main/main_page.dart';
import 'package:short_video/utils/hud_util.dart';

import 'other/user_manager.dart';

void main() {
  UserManager();
  HudUtil.ready();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Global.navigatorKey,
      title: "Short Video",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      builder: EasyLoading.init(),
    );
  }
}
