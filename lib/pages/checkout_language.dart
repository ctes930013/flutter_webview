import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/config/application.dart';
import 'package:flutterwebview/config/routes.dart';
import 'package:flutterwebview/providers/language_provider.dart';
import 'package:provider/provider.dart';

class CheckoutLanguage extends StatelessWidget {
  const CheckoutLanguage({Key? key}) : super(key: key);

  //點擊繁體中文按鈕
  void transChineseClick(context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context, listen: false);
    provider.setLocale(const Locale('zh', 'TW'));
    restartApp(context);
  }

  //點擊簡體中文按鈕
  void simChineseClick(context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context, listen: false);
    provider.setLocale(const Locale('zh', 'CN'));
    restartApp(context);
  }

  //點擊英文按鈕
  void englishClick(context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context, listen: false);
    provider.setLocale(const Locale('en'));
    restartApp(context);
  }

  //重啟app
  void restartApp(context){
    Application.router.navigateTo(
      context,
      Routes.root,
      transition: TransitionType.fadeIn,
      clearStack: true,    //清除之前所有頁面
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //debugPaintSizeEnabled = true;
    return Scaffold(
        body:
        Container(
          margin: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  child: MaterialButton(
                      child: const Text(
                          '繁體中文',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )
                      ),
                      color: Colors.blueAccent,
                      onPressed: () => {
                        transChineseClick(context)
                      }
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: MaterialButton(
                      child: const Text(
                          '简体中文',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )
                      ),
                      color: Colors.redAccent,
                      onPressed: () => {
                        simChineseClick(context)
                      }
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: MaterialButton(
                      child: const Text(
                          'English',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )
                      ),
                      color: Colors.greenAccent,
                      onPressed: () => {
                        englishClick(context)
                      }
                  ),
                )
              ]
          ),
        )
    );
  }
}