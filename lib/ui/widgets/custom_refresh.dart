import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomRefresh extends StatelessWidget {
  /// 控制器
  final RefreshController controller;

  /// 子组件
  final Widget? child;

  /// 刷新头部
  final Widget? header;

  /// 刷新尾部
  final Widget? footer;

  /// 是否允许下拉刷新
  final bool enablePullDown;

  /// 是否允许上拉加载
  final bool enablePullUp;

  /// 刷新回调
  final VoidCallback? onRefresh;

  /// 加载回调
  final VoidCallback? onLoading;

  /// 用于SingleChildView设置
  final bool? primary;

  /// 用于SingleChildView设置
  final ScrollPhysics? physics;

  /// 用于SingleChildView设置
  final Axis? scrollDirection;

  /// 用于SingleChildView设置
  final ScrollController? scrollController;

  /// 是否Material头部
  final bool isMaterialHeader;

  const CustomRefresh({
    Key? key,
    required this.controller,
    this.child,
    this.header,
    this.footer,
    this.enablePullDown = true,
    this.enablePullUp = false,
    this.onRefresh,
    this.onLoading,
    this.primary,
    this.physics,
    this.scrollDirection,
    this.scrollController,
    this.isMaterialHeader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      child: child,
      header: isMaterialHeader
          ? const MaterialClassicHeader()
          : const ClassicHeader(
              idleText: "下拉刷新",
              releaseText: "释放刷新",
              refreshingText: "正在刷新...",
              completeText: "完成刷新",
            ),
      footer: const ClassicFooter(
        idleText: "上拉加载",
        canLoadingText: "释放加载",
        loadingText: "正在加载...",
        noDataText: "没有更多数据了!",
      ),
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      onRefresh: onRefresh,
      onLoading: onLoading,
      primary: primary,
      physics: physics,
      scrollDirection: scrollDirection,
      scrollController: scrollController,
    );
  }
}
