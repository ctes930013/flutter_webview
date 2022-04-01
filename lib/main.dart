/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:flutterwebview/config/constants.dart';
import 'package:flutterwebview/providers/home_load_more_provider.dart';
import 'package:flutterwebview/providers/language_provider.dart';
import 'package:flutterwebview/providers/web_provider.dart';
import 'package:flutterwebview/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutterwebview/providers/home_recommend_upper_section_provider.dart';
import 'package:intl/intl.dart';

import 'components/app/app_component.dart';
import 'package:flutter/material.dart';

void main() {
  //等待初始化完成，否則報error
  WidgetsFlutterBinding.ensureInitialized();

  //設定系統預設語系
  Intl.defaultLocale = Constants.languageTraditional;
  LanguageProvider languageProvider =
      LanguageProvider(const Locale('zh', 'TW'));

  //由偏好設定中取得語系
  languageProvider.getLocalePref().then((value) {
    Locale locale;
    if (value == Constants.languageEnglish) {
      locale = const Locale('en');
    } else if (value == Constants.languageSimplify) {
      locale = const Locale('zh', 'CN');
    } else {
      locale = const Locale('zh', 'TW');
    }
    runApp(
      //引入provider
      MultiProvider(
        providers: [
          ChangeNotifierProvider<WebProvider>(
            create: (context) => WebProvider(false),
          ),
          ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(false),
          ),
          ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider(locale),
          ),
          ChangeNotifierProvider<HomeRecommendUpperSectionProvider>(
            create: (context) => HomeRecommendUpperSectionProvider(true),
          ),
          ChangeNotifierProvider<HomeLoadMoreProvider>(
            create: (context) => HomeLoadMoreProvider(false),
          ),
        ],
        child: AppComponent(),
      ),
    );
  });
}
