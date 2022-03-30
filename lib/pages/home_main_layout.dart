import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterwebview/components/widgets/home_banner_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutterwebview/components/data/generate_data.dart';
import 'package:flutterwebview/models/models/home_grid_data.dart';
import '../components/gridview/home_main_grid.dart';
import '../components/widgets/home_upper_button_section.dart';
import '../components/widgets/home_recommend_upper_section.dart';
import '../providers/home_recommend_upper_section_provider.dart';

//首頁的gridview
class HomeMainLayout extends StatefulWidget {
  const HomeMainLayout({Key? key}) : super(key: key);

  @override
  State createState() => HomeMainLayoutState();
}

class HomeMainLayoutState extends State<HomeMainLayout> {
  //定義stream控制器
  StreamController<List<HomeGridData>> gridStreamController =
      StreamController();
  //定義資料總筆數
  int total = 10;

  //定義scroll控制器
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化stream
    gridStreamController = StreamController<List<HomeGridData>>();
  }

  @override
  Widget build(BuildContext context) {
    HomeRecommendUpperSectionProvider provider =
        Provider.of<HomeRecommendUpperSectionProvider>(context, listen: true);

    GenerateData generateData = GenerateData();

    //下拉刷新
    return Column(
      children: [
        //首頁上方滾輪切換過場動畫
        AnimatedOpacity(
          opacity: !provider.scrollForward ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: !provider.scrollForward
              ? const HomeUpperButtonSection()
              : const SizedBox(),
        ),
        AnimatedOpacity(
          opacity: provider.scrollForward ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: provider.scrollForward
              ? const HomeRecommendUpperSection()
              : const SizedBox(),
        ),
        Expanded(
          child: RefreshIndicator(
            //下拉刷新的處理事件
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2)); //delay
              gridStreamController.sink.add(generateData.getListData(total));
              return Future.value();
            },
            //利用下拉刷新加上stream builder
            child: StreamBuilder(
              initialData: generateData.getListData(total), //初始值
              stream: gridStreamController.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<HomeGridData>> snapshot) {
                List<HomeGridData> data = snapshot.data ?? []; //get data
                return Listener(
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Column(
                      children: <Widget>[
                        // Container(
                        //   color: Colors.amber,
                        //   height: 100,
                        //   child: Text('12seeeee3'),
                        // ),
                        // Container(
                        //   color: Colors.purple,
                        //   height: 200,
                        //   child: Text('12efewfefwe3'),
                        // ),
                        HomeMainGrid(data),
                        const HomeBannerWidget(),
                      ],
                    ),
                  ),
                  onPointerDown: (event) {
                    provider.lastDownY = event.position.distance;
                  },
                  //控制首頁上方section根據滾輪上下切換
                  onPointerMove: (event) {
                    var position = event.position.distance;
                    double detal = 0;
                    if (provider.lastDownY != 0) {
                      detal = position - provider.lastDownY;
                    }
                    if (detal > 25) {
                      //顯示跑馬燈以及圖片
                      provider.setScrollForward(true);
                      provider.setLastDownY(position);
                    } else if (detal < -25) {
                      //顯示按鈕
                      provider.setScrollForward(false);
                      provider.setLastDownY(position);
                    }
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    gridStreamController.close();
  }
}
