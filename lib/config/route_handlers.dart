import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/components/web/web.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutterwebview/config/api.dart';
import 'package:flutterwebview/initialization_app.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/index.dart';
import '../pages/ranking.dart';
import '../pages/search.dart';
import '../pages/chat_room.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const InitializationApp();
});

var indexHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return Index(
    index: params['index']?.first ?? "0",
  );
});

var webHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  //倘若不是h5，則直接進webview
  if (!kIsWeb) {
    return Web(
      txt: params['txt']?.first ?? "",
    );
  }

  //倘若是h5，直接跳轉網頁
  launchURL();
});

var rankingHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Ranking();
});

var searchHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Search();
});

var chatRoomHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ChatRoom();
});

launchURL() {
  launch(API.apiUrl);
}
