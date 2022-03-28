import '../../models/models/home_upper_button_section_data.dart';
import '../../models/models/home_recommend_upper_model.dart';
import 'package:flutterwebview/generated/l10n.dart';

class HomeUpperButtonData {
  List<HomeUpperButtonSectionData> getButtonList() {
    return [
      HomeUpperButtonSectionData(text: S.current.recommendation, id: 0),
      HomeUpperButtonSectionData(text: S.current.new_show, id: 1),
      HomeUpperButtonSectionData(text: S.current.pretty, id: 2),
      HomeUpperButtonSectionData(text: S.current.new_star, id: 3),
      HomeUpperButtonSectionData(text: S.current.dancing, id: 4),
      HomeUpperButtonSectionData(text: S.current.friendship, id: 5),
      HomeUpperButtonSectionData(text: S.current.music, id: 6),
      HomeUpperButtonSectionData(text: S.current.godness, id: 7)
    ];
  }

  List<HomeRecommendUpperModel> getReccommendButtonList() {
    const String imgPath = 'lib/images/banner/';
    return [
      HomeRecommendUpperModel(img: imgPath + 'banner01.png', id: 0),
      HomeRecommendUpperModel(img: imgPath + 'banner02.png', id: 1),
      HomeRecommendUpperModel(img: imgPath + 'banner03.png', id: 2),
      HomeRecommendUpperModel(img: imgPath + 'banner04.png', id: 3),
      HomeRecommendUpperModel(img: imgPath + 'banner05.png', id: 4),
      HomeRecommendUpperModel(img: imgPath + 'banner06.png', id: 5),
      HomeRecommendUpperModel(img: imgPath + 'banner07.png', id: 6),
      HomeRecommendUpperModel(img: imgPath + 'banner08.png', id: 7),
      HomeRecommendUpperModel(img: imgPath + 'banner09.png', id: 8),
      HomeRecommendUpperModel(img: imgPath + 'banner10.png', id: 9)
    ];
  }
}
