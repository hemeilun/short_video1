import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:short_video/ui/widgets/custom_network_image.dart';
import 'package:short_video/utils/asset_util.dart';

import '../../../utils/color_util.dart';
import '../../../view_model/publish/publish_view_model.dart';
import '../../widgets/custom_scaffold.dart';

class PublishPage extends StatefulWidget {
  const PublishPage({Key? key}) : super(key: key);

  @override
  State<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PublishViewModel(),
      child: Consumer<PublishViewModel>(builder: (context, viewModel, child) {
        return CustomScaffold(
          context: context,
          title: "发布",
          actions: [
            GestureDetector(
              child: AssetUtil.svgImage("other/send",
                  size: const Size(28, 28), color: ColorsUtil.COLOR_999999),
              behavior: HitTestBehavior.opaque,
              onTap: () {
                viewModel.publish(context);
              },
            )
          ],
          elevation: 0.2,
          backgroundColor: ColorsUtil.COLOR_FFFFFF,
          child: _buildContent(viewModel),
        );
      }),
    );
  }

  Widget _buildContent(PublishViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 150,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                    color: ColorsUtil.COLOR_DBDBDB,
                    width: 0.5,
                    style: BorderStyle.solid)),
            child: TextField(
              keyboardType: TextInputType.text,
              style:
                  const TextStyle(fontSize: 16, color: ColorsUtil.COLOR_333333),
              controller: viewModel.introduceController,
              cursorHeight: 16,
              cursorColor: ColorsUtil.COLOR_666666,
              decoration: const InputDecoration(
                isCollapsed: false,
                border: InputBorder.none,
                hintText: "请输入合适的作品介绍，让更多的人看到",
                hintStyle:
                    TextStyle(fontSize: 16, color: ColorsUtil.COLOR_999999),
              ),
              keyboardAppearance: Brightness.light,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CustomNetworkImage(
                fit: BoxFit.cover,
                url:
                    "https://img1.baidu.com/it/u=1773366646,898438994&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=889",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
