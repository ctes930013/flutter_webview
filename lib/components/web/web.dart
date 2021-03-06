import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/components/result/result.dart';
import 'package:flutterwebview/components/utils/webview_utils.dart';
import 'package:flutterwebview/config/api.dart';
import 'package:flutterwebview/providers/web_provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:flutterwebview/generated/l10n.dart';

class Web extends StatefulWidget {
  //接收由上一頁傳入的值
  final String txt;

  const Web({Key? key, required this.txt}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebState();
  }
}

class _WebState extends State<Web> {
  //定義webview的第一頁url
  final String page1Url = "landing";
  //定義webview的第二頁url
  final String page2Url = "";
  //紀錄當前在哪個路由
  int currentPage = 1;
  //紀錄上一頁使用者輸入的值
  late String txt;
  late WebViewController _controller;
  //倒數計時器
  late Timer timer;
  //倒數的秒數
  int counter = 5;
  @override
  Widget build(BuildContext context) {
    //接收由上一頁傳入的值
    txt = widget.txt;

    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView"),
      ),
      body: Stack(
        children: [
          WebViewUtils(
            initialUrl: API.apiUrl,
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            //頁面準備加載
            onPageStarted: (url) {
              //改變webview provider的載入狀態為正在載入
              WebViewUtils.statusControl(context, true);
            },
            //頁面加載完成
            onPageFinished: (url) {
              //傳值到web端
              _controller.runJavascript('fromFlutter("' + txt + '")');
              //改變webview provider的載入狀態為載入完成
              WebViewUtils.statusControl(context, false);
            },
            //偵測錯誤
            onWebResourceError: (WebResourceError error) {
              WebViewUtils.timeoutHandler(context, error);
            },
            javascriptChannels: {
              //由web端傳值回來
              JavascriptChannel(
                  name: 'Toast',
                  onMessageReceived: (JavascriptMessage message) {
                    //print("Result: ${message.message}");
                    //show web message
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "${S.of(context).value_from_web}: ${message.message}"),
                    ));
                  })
            },
            navigationDelegate: (NavigationRequest request) {
              //檢查點擊事件連結的開頭
              String urlScheme = request.url;
              //print("URL: ${urlScheme}");
              if (urlScheme.startsWith("flutterweb://")) {
                //ex:flutterweb://result?value=cool
                var urlSchemeArr = urlScheme.split("://");
                if (urlSchemeArr.length < 2) {
                  return NavigationDecision.navigate;
                }
                String scheme = urlSchemeArr[0];
                String host = urlSchemeArr[1];
                if (host.startsWith("result")) {
                  var uri =
                      Uri.dataFromString(urlScheme); //converts string to a uri
                  //取得連結query參數
                  String value = uri.queryParameters["value"] ?? "";
                  //移除該頁面
                  //Navigator.pop(context);
                  //換頁
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                                value: value,
                              )));
                  //webview不要換頁
                  return NavigationDecision.prevent;
                }
              }
              //webview直接換頁
              return NavigationDecision.navigate;
            },
          ),
          //利用select監聽網頁狀態進度圈
          Selector<WebProvider, bool>(
            selector: (_, provider) => provider.isLoadFinish,
            builder: (context, isLoadFinish, child) {
              return (isLoadFinish)
                  ? Container(
                      child: Column(
                        children: [
                          const Center(child: CircularProgressIndicator()),
                          Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                  S.of(context).use_provider_control_load)),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      color: Colors.black12)
                  : Container();
            },
          ),
        ],
      ),
    );
  }
}
