import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/result.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web extends StatefulWidget{

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

  //定義webview的url
  final String url = "http://34.146.148.69:8080/";
  late String txt;
  late WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    //接收由上一頁傳入的值
    txt = widget.txt;

    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView"),
      ),
      body:
      WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        onPageFinished: (url) {
          //傳值到web端
          _controller.runJavascript('fromFlutter("'+txt+'")');
        },
        javascriptChannels: {
          //由web端傳值回來
          JavascriptChannel(
              name: 'Toast',
              onMessageReceived: (JavascriptMessage message) {
                //print("Result: ${message.message}");
                //show web message
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Web端回傳的值: ${message.message}"),
                ));
              }
          )
        },
        navigationDelegate: (NavigationRequest request){
          //檢查點擊事件連結的開頭
          String urlScheme = request.url;
          //print("URL: ${urlScheme}");
          if(urlScheme.startsWith("flutterweb://")) {
            //ex:flutterweb://result?value=cool
            String scheme = urlScheme.split("://")[0] ?? '';
            String host = urlScheme.split("://")[1] ?? '';
            if(host.startsWith("result")){
              var uri = Uri.dataFromString(urlScheme);  //converts string to a uri
              //取得連結query參數
              String value = uri.queryParameters["value"] ?? "";
              //移除該頁面
              //Navigator.pop(context);
              //換頁
              Navigator.push(context, MaterialPageRoute(builder: (context) => Result(
                value: value,
              )));
              //webview不要換頁
              return NavigationDecision.prevent;
            }
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}