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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwebview/components/utils/keyboard_utils.dart';
import 'package:flutterwebview/config/constants.dart';
import 'package:flutterwebview/generated/l10n.dart';
import 'package:flutterwebview/providers/language_provider.dart';
import 'package:flutterwebview/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../config/application.dart';
import '../../config/routes.dart';
import '../../models/ui/theme.dart';

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
    //監聽使用者設定語系
    Locale newLocale = context.select((LanguageProvider provider) => provider.getLocale);

    //初始化樣式
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    bool isNightMode = provider.isNightMode;
    ThemeMode themeMode = isNightMode ? ThemeMode.dark : ThemeMode.light;

    //初始化app
    //引用自適應套件
    final app = ScreenUtilInit(
      //理想的標準尺寸
      designSize: const Size(375, 667),
      minTextAdapt: true,
      builder: (){
        return MaterialApp(
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
          builder: (context, child) {
            //初始化自適應套件
            ScreenUtil.setContext(context);
            return Scaffold(
              //偵測只要點擊空白處就自動隱藏鍵盤
              body: GestureDetector(
                onTap: () {
                  KeyboardUtils.hideKeyboard(context);
                },
                child: child,
              ),
            );
          }
        );
      },
    );
    return app;
  }
}
