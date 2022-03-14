import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/result.dart';
import 'package:flutterwebview/web_provider.dart';
import 'package:provider/provider.dart';
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
    //引入provider
    return ChangeNotifierProvider<WebProvider>(
      create: (_) => WebProvider(false),
      builder: (context, child){
        //接收由上一頁傳入的值
        txt = widget.txt;

        final WebProvider webProvider = Provider.of<WebProvider>(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text("WebView"),
          ),
          body:
            Stack(
              children: [
                WebView(
                  initialUrl: url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller) {
                    _controller = controller;
                  },
                  //頁面準備加載
                  onPageStarted: (url) {
                    //改變webview provider的載入狀態為正在載入
                    WebProvider provider = Provider.of<WebProvider>(context, listen: false);
                    provider.setLoadFinish(true);
                  },
                  //頁面加載完成
                  onPageFinished: (url) {
                    //傳值到web端
                    _controller.runJavascript('fromFlutter("'+txt+'")');
                    //改變webview provider的載入狀態為載入完成
                    WebProvider provider = Provider.of<WebProvider>(context, listen: false);
                    provider.setLoadFinish(false);
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
                //進度圈
                Container(
                  child: (webProvider.isLoadFinish) ?
                  Container(
                    child: const Center(child: CircularProgressIndicator(),),
                    color: Colors.black12
                  ) : Container(),
                ),
              ],
            ),
        );
      },
    );
  }
}