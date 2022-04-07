import 'package:flutter/material.dart';
import 'package:flutterwebview/components/utils/banner/banner_swiper_utils.dart';

//首頁的輪播圖
class HomeBannerWidget extends StatefulWidget {
  const HomeBannerWidget({Key? key}) : super(key: key);

  @override
  State createState() => HomeBannerWidgetState();
}

class HomeBannerWidgetState extends State<HomeBannerWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> bannerList = [
      'lib/images/banner/banner11.png',
      'lib/images/banner/banner12.png',
      'lib/images/banner/banner13.png',
      'lib/images/banner/banner14.png',
      'lib/images/banner/banner15.png',
    ];

    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      child: BannerSwiperUtils(
        //定義寬高
        height: 70,
        width: 30,
        //輪播數量
        length: bannerList.length,

        //輪播的item
        getwidget: (index) {
          return GestureDetector(
              child: Image.asset(
                bannerList[index % bannerList.length],
                fit: BoxFit.cover,
              ),
              onTap: () {
                //點擊事件
              });
        },
      ),
    );
  }
}
