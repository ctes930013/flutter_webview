import 'package:flutter/material.dart';

//首頁底部加載的provider
class HomeLoadMoreProvider extends ChangeNotifier{
  //紀錄是否正在加載
  bool isLoading = false;

  //取得網頁是否加載完成
  bool get loading => isLoading;

  HomeLoadMoreProvider(this.isLoading);

  setLoadFinish(isLoading){
    this.isLoading = isLoading;
    notifyListeners();
  }

}