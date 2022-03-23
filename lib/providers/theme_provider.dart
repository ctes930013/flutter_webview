import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  //是否夜間模式
  bool isNightMode;

  ThemeProvider(this.isNightMode);

  setNightMode(isNightMode) {
    this.isNightMode = isNightMode;
    notifyListeners();
  }
}
