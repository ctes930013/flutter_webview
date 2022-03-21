
import 'package:flutter/material.dart';

//用於鍵盤處理相關套件
class KeyboardUtils{

  //隱藏鍵盤
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}