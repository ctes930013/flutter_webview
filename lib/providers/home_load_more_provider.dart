import 'package:flutter/material.dart';

//首頁底部加載的provider
class HomeLoadMoreProvider extends ChangeNotifier{
  //紀錄是否正在加載
  bool isLoading = false;
  //紀錄資料是否全部加載完畢
  bool isDataEnd = false;

  //取得底部是否加載完成
  bool get loading => isLoading;

  //取得資料是否全部加載完畢
  bool get dataEnd => isDataEnd;

  HomeLoadMoreProvider(this.isLoading, this.isDataEnd);

  setLoadFinish(isLoading){
    this.isLoading = isLoading;
    notifyListeners();
  }

  setDataEnd(isDataEnd){
    this.isDataEnd = isDataEnd;
    notifyListeners();
  }

}