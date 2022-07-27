import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:short_video/utils/color_util.dart';

import '../../utils/hud_util.dart';

class PhoneCodeRow extends StatefulWidget {
  final double height;
  final TextStyle? inputStyle;
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isShowCode;
  final TextEditingController? phoneController;
  final Function? onChanged;
  final Function? onPressed;
  final Function? onClear;

  const PhoneCodeRow({
    Key? key,
    this.height = 50,
    this.inputStyle,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.inputFormatters,
    this.isShowCode = false,
    this.phoneController,
    this.onChanged,
    this.onPressed,
    this.onClear,
  }) : super(key: key);

  @override
  _PhoneCodeRowState createState() => _PhoneCodeRowState();
}

class _PhoneCodeRowState extends State<PhoneCodeRow> {
  String _codeString = "获取验证码";
  int _seconds = 60;
  Timer? _codeTimer;
  TextStyle _codeStyle =
      const TextStyle(fontSize: 16, color: ColorsUtil.COLOR_FF5C5C);

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 16, right: widget.isShowCode == true ? 20 : 0),
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(widget.height / 2)),
        border: Border.all(
            color: ColorsUtil.COLOR_DBDBDB,
            width: 0.5,
            style: BorderStyle.solid),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.phone,
              style: widget.inputStyle ??
                  const TextStyle(fontSize: 16, color: ColorsUtil.COLOR_333333),
              controller: widget.controller,
              cursorHeight: 16,
              cursorColor: ColorsUtil.COLOR_666666,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                // isCollapsed: false,
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ??
                    const TextStyle(
                        fontSize: 16, color: ColorsUtil.COLOR_999999),
                suffixIcon: (widget.controller?.text.isNotEmpty == true)
                    ? GestureDetector(
                        child: const Icon(Icons.cancel,
                            color: ColorsUtil.COLOR_DBDBDB, size: 20),
                        onTap: () {
                          widget.controller?.clear();
                          widget.onClear?.call();
                          setState(() {});
                        },
                      )
                    : null,
              ),
              keyboardAppearance: Brightness.dark,
              onChanged: (value) {
                widget.onChanged?.call(value);
                setState(() {});
              },
            ),
          ),
          widget.isShowCode == true
              ? Row(
                  children: [
                    Container(
                        width: 0.5, height: 12, color: ColorsUtil.COLOR_DBDBDB),
                    const SizedBox(width: 20),
                    GestureDetector(
                      child: Text(_codeString, style: _codeStyle),
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        debugPrint("${widget.phoneController?.text}");
                        var text = widget.phoneController?.text;
                        if (text != null && text.isNotEmpty) {
                          if (_seconds == 60) {
                            _seconds--;
                            _startTimer();
                            widget.onPressed?.call();
                          }
                        } else {
                          HudUtil.toast("手机号不能为空");
                        }
                      },
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  void _startTimer() {
    if (_codeTimer != null) {
      return;
    }
    _codeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _codeString = "剩余${_seconds--}秒";
        _codeStyle =
            const TextStyle(fontSize: 16, color: ColorsUtil.COLOR_666666);
      } else {
        _codeString = "重新获取";
        _codeStyle =
            const TextStyle(fontSize: 16, color: ColorsUtil.COLOR_FF5C5C);
        _seconds = 60;
        _cancelTimer();
      }
      setState(() {});
    });
  }

  void _cancelTimer() {
    if (_codeTimer != null) {
      _codeTimer?.cancel();
      _codeTimer = null;
    }
  }
}
