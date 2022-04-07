import 'package:flutter/material.dart';

class BannerSwiperUtilsProvider extends ChangeNotifier {
  //是否向右刷列表
  String scrollStatus;

  BannerSwiperUtilsProvider(this.scrollStatus);

  setScrollStatus(scrollStatus) {
    this.scrollStatus = scrollStatus;
    notifyListeners();
  }
}
