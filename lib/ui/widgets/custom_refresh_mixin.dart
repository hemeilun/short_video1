import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin CustomRefreshMixin<T> {
  RefreshController refreshController = RefreshController(initialRefresh: true);

  void setupManualRefreshController() {
    refreshController = RefreshController(initialRefresh: false);
  }

  ///接口返回的数据
  List<T> datas = [];

  bool hasNext = false; //是否还有数据
  int _page = 1; //当前页

  Future<List<T>> requestList(int page);

  void onRefresh() async {
    _page = 1;
    List<T> list = await requestList(_page);
    datas.clear();
    datas.addAll(list);
    onRequestComplete();
    refreshController.refreshCompleted(resetFooterState: true);
    if (hasNext) {
      debugPrint("0--------有数据");
      refreshController.resetNoData();
    } else {
      debugPrint("0--------没有数据");
      refreshController.loadNoData();
    }
  }

  void onLoading() async {
    if (hasNext) {
      _page++;
      List<T> list = await requestList(_page);
      datas.addAll(list);
      onRequestComplete();
      refreshController.loadComplete();
    }

    if (hasNext) {
      debugPrint("1--------有数据");
      refreshController.resetNoData();
    } else {
      debugPrint("1--------没有数据");
      refreshController.loadNoData();
    }

  }

  ///用于在数据加载完成后的操作
  ///具体的业务Model通过此函数执行notifyListeners();
  void onRequestComplete() {}

  void callRefresh() {
    refreshController.requestRefresh(duration: const Duration(milliseconds: 300),);
  }
}
