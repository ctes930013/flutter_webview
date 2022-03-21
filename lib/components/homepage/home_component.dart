import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutterwebview/components/utils/KeyboardUtils.dart';
import 'package:flutterwebview/config/application.dart';
import '../../config/routes.dart';
import '../web/web.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeComponent extends StatefulWidget {
  @override
  State createState() => HomeComponentState();
}

class HomeComponentState extends State<HomeComponent> {
  TextEditingController keyText = TextEditingController();      //欄位輸入框

  //按鈕觸發事件
  void submit(context) {
    String txt = keyText.value.text;
    if(txt == "") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("請勿為空"),
      ));
      return;
    }

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
          title: const Text("原生App"),
        ),
        body:
        Container(
          margin: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: keyText,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.title),
                    labelText: "請輸入要傳入WebView的值",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  child: MaterialButton(
                      child: const Text(
                          '送出',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )
                      ),
                      color: Colors.blueAccent,
                      onPressed: () => {
                        //隱藏鍵盤
                        KeyboardUtils.hideKeyboard(context),
                        submit(context)
                      }
                  ),
                )
              ]
          ),
        )
    );
  }
}