import '../../models/models/home_upper_button_section_data.dart';
import '../../models/models/home_recommend_upper_model.dart';

class HomeUpperButtonData {
  List<HomeUpperButtonSectionData> getButtonList() {
    return [
      HomeUpperButtonSectionData(text: '推薦', id: 0),
      HomeUpperButtonSectionData(text: '星秀', id: 1),
      HomeUpperButtonSectionData(text: '顏值', id: 2),
      HomeUpperButtonSectionData(text: '新人', id: 3),
      HomeUpperButtonSectionData(text: '舞蹈', id: 4),
      HomeUpperButtonSectionData(text: '交友', id: 5),
      HomeUpperButtonSectionData(text: '音樂', id: 6),
      HomeUpperButtonSectionData(text: '女神', id: 7)
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
