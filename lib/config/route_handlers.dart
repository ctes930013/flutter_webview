import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/components/web/web.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

import '../components/homepage/home_component.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return HomeComponent();
});

var webHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      if (!kIsWeb) {
        return Web(txt: params['txt']?.first ?? "",);
      }

      launchURL();
    }
);


launchURL() {
  launch('https://www.himmy.cn/');
}