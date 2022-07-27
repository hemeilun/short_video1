import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:short_video/ui/widgets/phone_code_row.dart';
import 'package:short_video/utils/asset_util.dart';
import 'package:short_video/view_model/common/login_view_model.dart';

import '../../../utils/color_util.dart';

class LoginPage extends StatefulWidget {
  final bool? isForce;
  const LoginPage({Key? key, this.isForce}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(builder: (context, viewModel, child) {
        return GestureDetector(
          child: Scaffold(
            backgroundColor: ColorsUtil.COLOR_FFFFFF,
            body: _buildContent(viewModel),
          ),
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
        );
      }),
    );
  }

  Widget _buildContent(LoginViewModel viewModel) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight),
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 40,
              alignment: Alignment.centerRight,
              child: widget.isForce == true ? null : GestureDetector(
                child: AssetUtil.svgImage("other/close",
                    size: const Size(26, 26), color: ColorsUtil.COLOR_666666),
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  viewModel.close(context);
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "登录/注册",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: ColorsUtil.COLOR_333333,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "未注册的手机号验证通过后将自动注册",
              style: TextStyle(
                fontSize: 16,
                color: ColorsUtil.COLOR_999999,
              ),
            ),
            const SizedBox(height: 40),
            PhoneCodeRow(
              controller: viewModel.phoneController,
              hintText: "请输入手机号码",
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              ],
              onChanged: (value) {
                viewModel.checkLogin();
              },
              onClear: () {
                viewModel.checkLogin();
              },
            ),
            const SizedBox(height: 20),
            PhoneCodeRow(
              controller: viewModel.codeController,
              phoneController: viewModel.phoneController,
              hintText: "请输入验证码",
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              ],
              isShowCode: true,
              onChanged: (value) {
                viewModel.checkLogin();
              },
              onPressed: () {
                viewModel.getCode(context);
              },
              onClear: () {
                viewModel.checkLogin();
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              child: Container(
                height: 40,
                child: Text.rich(TextSpan(children: [
                  WidgetSpan(
                    child: AssetUtil.svgImage(
                        viewModel.isAgree ? "other/select" : "other/unselect",
                        size: const Size(16, 16),
                        color: viewModel.isAgree
                            ? ColorsUtil.COLOR_FF5C5C
                            : ColorsUtil.COLOR_999999),
                  ),
                  const TextSpan(
                    text: " 我已阅读并同意",
                    style:
                        TextStyle(fontSize: 12, color: ColorsUtil.COLOR_999999),
                  ),
                  TextSpan(
                      text: "《用户服务协议》",
                      style: const TextStyle(
                          fontSize: 12, color: ColorsUtil.COLOR_FF5C5C),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          viewModel.userAgreement(context);
                        }),
                  const TextSpan(
                    text: "和",
                    style:
                        TextStyle(fontSize: 12, color: ColorsUtil.COLOR_999999),
                  ),
                  TextSpan(
                      text: "《隐私政策条款》",
                      style: const TextStyle(
                          fontSize: 12, color: ColorsUtil.COLOR_FF5C5C),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          viewModel.privacyPolicy(context);
                        }),
                ])),
                alignment: Alignment.centerLeft,
              ),
              behavior: HitTestBehavior.opaque,
              onTap: () {
                viewModel.agree();
              },
            ),
            const SizedBox(height: 40),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: viewModel.isCanLogin
                      ? ColorsUtil.COLOR_FF5C5C
                      : ColorsUtil.COLOR_DBDBDB,
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                child: const Text("立即登录",
                    style: TextStyle(
                        fontSize: 16, color: ColorsUtil.COLOR_FFFFFF)),
              ),
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (viewModel.isCanLogin) {
                  viewModel.login(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
