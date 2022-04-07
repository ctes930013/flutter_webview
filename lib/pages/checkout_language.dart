import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutterwebview/components/utils/app_utils.dart';
import 'package:flutterwebview/config/application.dart';
import 'package:flutterwebview/config/constants.dart';
import 'package:flutterwebview/config/routes.dart';
import 'package:flutterwebview/providers/home_recommend_upper_section_provider.dart';
import 'package:flutterwebview/providers/language_provider.dart';
import 'package:provider/provider.dart';

class CheckoutLanguage extends StatelessWidget {
  const CheckoutLanguage({Key? key}) : super(key: key);

  //點擊繁體中文按鈕
  void transChineseClick(context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context, listen: false);
    provider.setLocale(const Locale('zh', 'TW'));
    AppUtils.restartApp(context);
  }

  //點擊簡體中文按鈕
  void simChineseClick(context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context, listen: false);
    provider.setLocale(const Locale('zh', 'CN'));
    AppUtils.restartApp(context);
  }

  //點擊英文按鈕
  void englishClick(context) {
    LanguageProvider provider = Provider.of<LanguageProvider>(context, listen: false);
    provider.setLocale(const Locale('en'));
    AppUtils.restartApp(context);
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