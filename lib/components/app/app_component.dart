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
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    bool isNightMode = provider.isNightMode;
    ThemeMode themeMode = isNightMode ? ThemeMode.dark : ThemeMode.light;

    Locale locale = context.select((LanguageProvider provider) => provider.getLocale);

    final app = MaterialApp(
      title: 'Fluro',
      //多國語言配置
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
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
//    print("initial route = ${app.initialRoute}");
    return app;
  }
}
