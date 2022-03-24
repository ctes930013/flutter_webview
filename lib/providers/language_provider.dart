import 'package:flutter/material.dart';
import 'package:flutterwebview/config/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

//多國語系的provider
class LanguageProvider extends ChangeNotifier{
  //紀錄語系
  Locale locale = const Locale('zh', 'TW');

  //取得儲存於偏好的語系
  Future<String> getLocalePref() async {
    //從偏好中讀取
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String local = prefs.getString(Constants.languageKey) ?? "";
    return local;
  }

  Locale get getLocale  => locale;

  LanguageProvider();

  setLocale(locale) async{
    this.locale = locale;
    //存入偏好
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants.languageKey, locale.toString());
    notifyListeners();
  }
}