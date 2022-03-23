import 'package:flutter/material.dart';

//多國語系的provider
class LanguageProvider extends ChangeNotifier{
  //紀錄語系
  Locale locale = const Locale('zh', 'TW');

  Locale get getLocale  => locale;

  LanguageProvider();

  setLocale(locale){
    this.locale = locale;
    notifyListeners();
  }
}