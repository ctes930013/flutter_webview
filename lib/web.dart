import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        title: Text(txt),
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
      ),
    );
  }
}