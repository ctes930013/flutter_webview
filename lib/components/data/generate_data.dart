//產生自定義假資料
import 'package:flutterwebview/components/data/home_grid_data.dart';

class GenerateData{

  static const String imgPath = 'lib/images/';
  //產生list array的資料
  static List<HomeGridData> getListData(){
    List<HomeGridData> data = [
      HomeGridData("一分快三", "菜鳥", "台中縣", imgPath + "av.jpg", 15000),
      HomeGridData("一分快三", "超小", "高雄縣", imgPath + "av.jpg", 2000),
      HomeGridData("一分快三", "A罩杯", "台中市", imgPath + "av.jpg", 18000),
      HomeGridData("一分快三", "老窩", "桃園縣", imgPath + "av.jpg", 10000),
      HomeGridData("一分快三", "迦納", "台北市", imgPath + "av.jpg", 15000),
      HomeGridData("一分快三", "微星", "台北市", imgPath + "av.jpg", 17000),
      HomeGridData("一分快三", "BBC", "台北市", imgPath + "av.jpg", 30000),
      HomeGridData("一分快三", "老外", "新竹市", imgPath + "av.jpg", 35000),
    ];

    return data;
  }
}