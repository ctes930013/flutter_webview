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
import 'package:flutterwebview/main.dart';
import 'package:flutterwebview/components/web/web.dart';

import '../components/homepage/home_component.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return HomeComponent();
});

var webHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
 return Web(txt: params['txt']?.first ?? "",);
});