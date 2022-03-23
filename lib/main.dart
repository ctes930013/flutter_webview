/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:flutterwebview/providers/language_provider.dart';
import 'package:flutterwebview/providers/web_provider.dart';
import 'package:flutterwebview/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'components/app/app_component.dart';
import 'package:flutter/material.dart';

void main() {
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
          create: (context) => LanguageProvider(),
        ),
      ],
      child: AppComponent(),
    ),
  );
}
