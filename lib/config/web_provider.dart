import 'package:flutter/material.dart';

//webview的provider
class WebProvider extends ChangeNotifier{
  //紀錄網頁是否加載完成
  bool isLoadFinish = false;

  //取得網頁是否加載完成
  bool get loadFinish => isLoadFinish;

  WebProvider(this.isLoadFinish);

  setLoadFinish(isLoadFinish){
    this.isLoadFinish = isLoadFinish;
    notifyListeners();
  }
}