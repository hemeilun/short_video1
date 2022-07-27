

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/utils/color_util.dart';
import '/ui/widgets/custom_network_image.dart';
import '/utils/asset_util.dart';
import '../../widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';
import '/view_model/home/comment_view_model.dart';
import '../../widgets/empty_page.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CommentViewModel(),
      child: Consumer<CommentViewModel>(builder: (context, viewModel, child) {
        return CustomScaffold(
          context: context,
          title: "评论",
          elevation: 0.2,
          backgroundColor: ColorsUtil.COLOR_FFFFFF,
          child: _buildContent(viewModel),
        );
      }),
    );
  }

  Widget _buildContent(CommentViewModel viewModel) {
    return viewModel.datas.isEmpty
        ? const EmptyPage()
        : ListView.builder(
      // shrinkWrap: true,
        itemCount: viewModel.datas.length,
        padding: EdgeInsets.zero,
        primary: true,
        // physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(context, viewModel, index);
        });
  }

  Widget _buildItem(BuildContext context, CommentViewModel viewModel, int index) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(left: 6, right: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 6, bottom: 20,),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: ColorsUtil.COLOR_DBDBDB,
                      width: 60,
                      height: 60,
                      child: const CustomNetworkImage(
                        url: "https://img1.baidu.com/it/u=1773366646,898438994&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
                        fit: BoxFit.cover,
                        logoSize: Size(1, 1),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        // color: Colors.blue,
                        // alignment: Alignment.centerLeft,
                        width: 300,
                        padding: const EdgeInsets.only(top: 5, bottom: 5, right:15),
                        child: const Text(
                          "随机用户",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle( fontSize: 12,
                          color: Colors.blueGrey,
                        ),
                        ),
                      ),
                      Container(
                        width: 300,
                        padding: const EdgeInsets.only(top: 1, bottom: 1, left: 15, right: 15),
                        child:
                        const Text(
                          "不辜负自己，莫错过流光，去做你想做的事，趁阳光正好，趁微风不燥。余生很长，何必慌张。你再优秀，也总有人对你不堪。你再不堪，也有人认为你是限量版的唯一",
                         textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorsUtil.COLOR_666666,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            index != viewModel.datas.length - 1
                ? Container(height: 0.5, color: ColorsUtil.COLOR_EBEBEB)
                : Container(),
          ],
        ),
      ),
    );
  }


}


