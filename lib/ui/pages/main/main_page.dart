import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:short_video/ui/pages/publish/publish_page.dart';
import 'package:short_video/utils/color_util.dart';
import 'package:short_video/utils/navigator_util.dart';

import 'initialize_items.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        color: ColorsUtil.COLOR_FFFFFF,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomBarItem(
                  selectIndex: currentIndex,
                  itemIndex: 0,
                  iconName: "home",
                  title: "首页"),
              _buildBottomBarItem(
                  selectIndex: currentIndex,
                  itemIndex: 1,
                  iconName: "profile",
                  title: "我的")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsUtil.COLOR_FFFFFF,
        child: Image.asset("assets/png/tabbar/publish_active.png",
            width: 32,
            gaplessPlayback: true),
        onPressed: () {
          NavigatorUtil.push(context, const PublishPage());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // BottomNavigationBar(
      //   backgroundColor: Colors.white,
      //   currentIndex: currentIndex,
      //   selectedFontSize: 14,
      //   unselectedFontSize: 14,
      //   type: BottomNavigationBarType.fixed,
      //   fixedColor: ColorsUtil.COLOR_FF5C5C,
      //   unselectedItemColor: ColorsUtil.COLOR_999999,
      //   elevation: 5,
      //   items: items,
      //   onTap: (index) {
      //     debugPrint("--------$index");
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      // ),
    );
  }

  Widget _buildBottomBarItem({
    required int selectIndex,
    required int itemIndex,
    String? iconName,
    String? title,
  }) {
    bool isSelected = selectIndex == itemIndex;
    return GestureDetector(
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Column(
          children: [
            Image.asset(
                isSelected
                    ? "assets/png/tabbar/${iconName}_active.png"
                    : "assets/png/tabbar/$iconName.png",
                width: 32,
                gaplessPlayback: true),
            const SizedBox(height: 4),
            Text(
              title ?? "",
              style: TextStyle(
                  fontSize: 14,
                  color: isSelected
                      ? ColorsUtil.COLOR_FF5C5C
                      : ColorsUtil.COLOR_999999),
            )
          ],
        ),
      ),
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (!isSelected) {
          setState(() {
            currentIndex = itemIndex;
          });
        }
      },
    );
  }
}
