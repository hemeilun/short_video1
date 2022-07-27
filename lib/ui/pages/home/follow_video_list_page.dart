import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_video/ui/widgets/custom_refresh.dart';
import 'package:short_video/utils/color_util.dart';

import '../../../entity/home/video_list_entity.dart';
import '../../../utils/asset_util.dart';
import '../../../view_model/home/follow_video_list_view_model.dart';
import '../../widgets/custom_gesture.dart';
import '../../widgets/empty_page.dart';
import '../../widgets/video_view.dart';

class FollowVideoListPage extends StatefulWidget {
  const FollowVideoListPage({Key? key}) : super(key: key);

  @override
  State<FollowVideoListPage> createState() => _FollowVideoListPageState();
}

class _FollowVideoListPageState extends State<FollowVideoListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => FollowVideoListViewModel(),
      child: Consumer<FollowVideoListViewModel>(
          builder: (context, viewModel, child) {
        return CustomRefresh(
          controller: viewModel.refreshController,
          enablePullUp: true,
          onRefresh: () async {
            viewModel.onRefresh();
          },
          onLoading: () async {
            viewModel.onLoading();
          },
          child: _buildContent(viewModel),
        );
      }),
    );
  }

  Widget _buildContent(FollowVideoListViewModel viewModel) {
    return viewModel.datas.isEmpty
        ? const EmptyPage(
            backgroundColor: ColorsUtil.COLOR_999999,
          )
        : PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: viewModel.datas.length,
            itemBuilder: (BuildContext context, int index) {
              VideoEntity entity = viewModel.datas[index];
              return Container(
                color: ColorsUtil.COLOR_999999,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoView(
                      url: entity.videoUrl ?? "",
                      cover: entity.imgUrl ?? "",
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _buildPageBottomContent(viewModel, index),
                    ),
                    Positioned(
                      right: 20,
                      bottom: 100,
                      child: _buildPageRightContent(viewModel, index),
                    ),
                  ],
                ),
              );
            },
          );
  }

  /// PageView底部内容
  Widget _buildPageBottomContent(
      FollowVideoListViewModel viewModel, int index) {
    VideoEntity entity = viewModel.datas[index];
    return Container(
      height: 120,
      padding: const EdgeInsets.all(20),
      color: ColorsUtil.COLOR_FFFFFF.withOpacity(0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entity.nickName ?? "",
            style:
                const TextStyle(fontSize: 14, color: ColorsUtil.COLOR_FFFFFF),
          ),
          const SizedBox(height: 8),
          Text(
            entity.title ?? "",
            style: TextStyle(fontSize: 14, color: ColorsUtil.COLOR_FFFFFF),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// PageView右边内容
  Widget _buildPageRightContent(FollowVideoListViewModel viewModel, int index) {
    VideoEntity entity = viewModel.datas[index];
    return Column(
      children: [
        _buildOperationOption(
          viewModel,
          iconName: "follow",
          onPressed: () {
            viewModel.follow(context);
          },
        ),
        const SizedBox(height: 20),
        _buildOperationOption(
          viewModel,
          iconName: "like",
          number: "${entity.likesCount}",
          onPressed: () {
            viewModel.like(context, entity);
          },
        ),
        const SizedBox(height: 20),
        _buildOperationOption(
          viewModel,
          iconName: "comment",
          number: "${entity.commentCount}",
          onPressed: () {
            viewModel.comment(context);
          },
        ),
        const SizedBox(height: 20),
        _buildOperationOption(
          viewModel,
          iconName: "forward",
          number: "0",
          onPressed: () {
            viewModel.forward(context);
          },
        ),
      ],
    );
  }

  Widget _buildOperationOption(FollowVideoListViewModel viewModel,
      {required String iconName, String? number, Function? onPressed}) {
    return CustomGesture(
      child: Column(
        children: [
          AssetUtil.svgImage("home/$iconName", size: const Size(28, 28)),
          const SizedBox(height: 4),
          number == null
              ? Container()
              : Text(
                  number,
                  style: const TextStyle(
                      fontSize: 13, color: ColorsUtil.COLOR_FFFFFF),
                ),
        ],
      ),
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onPressed?.call();
      },
    );
  }
}
