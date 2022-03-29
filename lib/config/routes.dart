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
import './route_handlers.dart';

class Routes {
  static String root = "/"; //預設的首頁
  static String web = "/web";
  static String index = "/index";
  static String demoFunc = "/demo/func";
  static String deepLink = "/message";
  static String ranking = "/ranking";
  static String search = "search";

  static String linLaoShi = "/sssss";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return;
    });

    router.define(root, handler: rootHandler);
    router.define(web, handler: webHandler);
    router.define(index, handler: indexHandler);
    router.define(ranking, handler: rankingHandler);
    router.define(search, handler: searchHandler);

    router.define(linLaoShi, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      // 如果是ios android
      print("SSS");
      return;
    }));
  }
}
