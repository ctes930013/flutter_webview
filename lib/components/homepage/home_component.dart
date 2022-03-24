import 'package:flutter/material.dart';
import 'package:flutterwebview/components/utils/btn_delay_utils.dart';
import 'package:flutterwebview/components/utils/keyboard_utils.dart';
import 'package:flutterwebview/config/application.dart';
import '../../config/routes.dart';
import 'package:flutterwebview/generated/l10n.dart';

class HomeComponent extends StatefulWidget {
  @override
  State createState() => HomeComponentState();
}

class HomeComponentState extends State<HomeComponent> {
  TextEditingController keyText = TextEditingController(); //欄位輸入框

  BtnDelayUtils btnDelayUtils = BtnDelayUtils(4);

  //按鈕觸發事件
  void submit(context) {
    //避免重複點擊
    if(!btnDelayUtils.intervalClick()){
      return;
    }
    String txt = keyText.value.text;
    if (txt == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(S.of(context).do_not_leave_blank),
      ));
      return;
    }

    //關閉所有提示框
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    //使用fluro路由換頁
    Application.router.navigateTo(
      context,
      Routes.web + "?txt=" + Uri.encodeComponent(txt),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //debugPaintSizeEnabled = true;
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).second_page_title),
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: keyText,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.title),
                    labelText: S.of(context).second_page_edit_hint,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  child: MaterialButton(
                      child: Text(S.of(context).second_page_btn_text,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      color: Colors.blueAccent,
                      onPressed: () => {
                            //隱藏鍵盤
                            KeyboardUtils.hideKeyboard(context),
                            submit(context)
                          }),
                ),
              ]),
        ));
  }
}
