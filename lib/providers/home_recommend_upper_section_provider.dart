import 'package:flutter/material.dart';

class HomeRecommendUpperSectionProvider extends ChangeNotifier {
  //是否向下刷列表
  bool scrollForward;
  double lastDownY = 0;

  HomeRecommendUpperSectionProvider(this.scrollForward);

  setScrollForward(scrollForward) {
    this.scrollForward = scrollForward;
    notifyListeners();
  }

  setLastDownY(distance) {
    lastDownY = distance;
    notifyListeners();
  }
}
