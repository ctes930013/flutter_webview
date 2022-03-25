import 'package:flutter/material.dart';
import 'package:flutterwebview/components/utils/disable_splash_utils.dart';

class Themes {
  static final light = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    brightness: Brightness.light,
    indicatorColor: Colors.amber,
    splashFactory: DisableSplashUtils(),    //關閉水波紋
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    indicatorColor: Colors.blueGrey,
    splashFactory: DisableSplashUtils(),
  );
}
