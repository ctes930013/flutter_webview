/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 *
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterwebview/components/utils/keyboard_utils.dart';
import 'package:flutterwebview/generated/l10n.dart';
import 'package:flutterwebview/providers/language_provider.dart';
import 'package:flutterwebview/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../config/application.dart';
import '../../config/routes.dart';
import '../../ui/theme.dart';

class AppComponent extends StatefulWidget {
  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    //初始化fluro
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = LanguageProvider();
    //監聽使用者設定語系
    Locale locale = context.select((LanguageProvider provider) => provider.getLocale);
    //等待讀取使用者設定的語系的偏好
    return FutureBuilder(
      future: languageProvider.getLocalePref(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        ThemeProvider provider = Provider.of<ThemeProvider>(context);
        bool isNightMode = provider.isNightMode;
        ThemeMode themeMode = isNightMode ? ThemeMode.dark : ThemeMode.light;

        print(locale);
        print(snapshot.data);
        //如果偏好有資料則根據偏好語言設定語系
        if(snapshot.data != null){
          if(snapshot.data == "en") {
            locale = const Locale('en');
          }else if(snapshot.data == "zh_CN") {
            locale = const Locale('zh', 'CN');
          }else if(snapshot.data == "zh_TW") {
            locale = const Locale('zh', 'TW');
          }
        }

        //初始化app
        final app = MaterialApp(
          title: 'Fluro',
          //多國語言配置
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          //當前支援的語系
          supportedLocales: S.delegate.supportedLocales,
          localeListResolutionCallback: (locales, supportedLocales) {
            print(locales);
            return;
          },
          //當前語系
          locale: locale,
          debugShowCheckedModeBanner: false,
          theme: Themes.light,
          themeMode: themeMode,
          darkTheme: Themes.dark,
          onGenerateRoute: Application.router.generator,
          builder: (context, child) => Scaffold(
            //偵測只要點擊空白處就自動隱藏鍵盤
            body: GestureDetector(
              onTap: () {
                KeyboardUtils.hideKeyboard(context);
              },
              child: child,
            ),
          ),
        );
        return app;
      },
    );
  }
}
