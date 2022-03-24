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
import 'package:flutterwebview/config/constants.dart';
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

  String locale = "";    //初始化語系為空

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    LanguageProvider languageProvider = LanguageProvider(const Locale('zh', 'TW'));
    //由偏好設定中取得語系
    String local = await languageProvider.getLocalePref();

    //rebuild widget
    setState(() {
      locale = local;
    });
  }

  @override
  Widget build(BuildContext context) {
    //等待取得語系偏好回傳值，避免provider被初始化
    if(locale == ""){
      return MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                color: Colors.white
            ),
          ),
        ),
      );
    }

    //如果偏好有資料則根據偏好語言設定語系
    Locale newLocale;
    if(locale == Constants.languageEnglish) {
      newLocale = const Locale('en');
    }else if(locale == Constants.languageSimplify) {
      newLocale = const Locale('zh', 'CN');
    }else {
      newLocale = const Locale('zh', 'TW');
    }

    return ChangeNotifierProvider<LanguageProvider>(
        create: (_) => LanguageProvider(newLocale),
        builder: (context, child){
          //監聽使用者設定語系
          newLocale = context.select((LanguageProvider provider) => provider.getLocale);

          //初始化樣式
          ThemeProvider provider = Provider.of<ThemeProvider>(context);
          bool isNightMode = provider.isNightMode;
          ThemeMode themeMode = isNightMode ? ThemeMode.dark : ThemeMode.light;

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
            locale: newLocale,
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
        }
    );
  }
}
