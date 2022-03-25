//產生自定義假資料
import 'dart:math';

import 'package:flutterwebview/models/ui/models/home_grid_data.dart';
import 'package:flutterwebview/generated/l10n.dart';

class GenerateData {
  static const String imgPath = 'lib/images/';

  List<HomeGridData> data = [
    HomeGridData(S.current.game_one_min_fast_three, S.current.a_cup,
        S.current.kaoshiung_city, imgPath + "av1.jpeg", 15000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.lao_wo,
        S.current.taichung_city, imgPath + "av.jpg", 2000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.a_cup,
        S.current.taichung_city, imgPath + "av1.jpeg", 18000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.lao_wo,
        S.current.kaoshiung_city, imgPath + "av.jpg", 10000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.a_cup,
        S.current.taichung_city, imgPath + "av1.jpeg", 15000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.tiny_cup,
        S.current.taichung_city, imgPath + "av.jpg", 17000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.lao_wo,
        S.current.kaoshiung_city, imgPath + "av1.jpeg", 30000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.a_cup,
        S.current.taichung_city, imgPath + "av.jpg", 35000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.tiny_cup,
        S.current.taichung_city, imgPath + "av1.jpeg", 10000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.tiny_cup,
        S.current.kaoshiung_city, imgPath + "av.jpg", 38000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.lao_wo,
        S.current.taichung_city, imgPath + "av1.jpeg", 25000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.a_cup,
        S.current.kaoshiung_city, imgPath + "av.jpg", 45000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.lao_wo,
        S.current.taichung_city, imgPath + "av1.jpeg", 20000),
    HomeGridData(S.current.game_one_min_fast_three, S.current.tiny_cup,
        S.current.kaoshiung_city, imgPath + "av.jpg", 5000),
  ];

  //隨機產生list array的資料
  List<HomeGridData> getListData(int count) {
    var rng = Random();
    List<HomeGridData> newData = [];
    for (var i = 0; i < count; i++) {
      newData.add(data[rng.nextInt(data.length)]);
    }

    return newData;
  }
}
