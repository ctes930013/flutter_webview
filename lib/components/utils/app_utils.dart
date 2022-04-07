import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutterwebview/config/constants.dart';
import 'package:flutterwebview/providers/home_recommend_upper_section_provider.dart';
import 'package:provider/provider.dart';

class AppUtils{

  //重啟app
  static void restartApp(context){
    Constants.isRestartApp = true;
    Phoenix.rebirth(context);

    //將首頁上方改回跑馬燈
    final HomeRecommendUpperSectionProvider homeUpperProvider =
    Provider.of<HomeRecommendUpperSectionProvider>(context, listen: false);
    homeUpperProvider.setScrollForward(true);
  }
}