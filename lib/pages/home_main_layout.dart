import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterwebview/components/data/generate_data.dart';
import 'package:flutterwebview/components/widgets/home_marquee_widget.dart';
import 'package:flutterwebview/models/models/home_grid_data.dart';
import '../components/gridview/home_main_grid.dart';
import '../components/widgets/home_upper_button_section.dart';
import '../components/widgets/home_recommend_upper_section.dart';

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
    GenerateData generateData = GenerateData();

    //下拉刷新
    return Column(
      children: [
        const HomeUpperButtonSection(),
        // const HomeRecommendUpperSection(),
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
                return NotificationListener<UserScrollNotification>(
                  child: SingleChildScrollView(
                    controller: ScrollController(),
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Colors.amber,
                          height: 100,
                          child: Text('12seeeee3'),
                        ),
                        Container(
                          color: Colors.purple,
                          height: 200,
                          child: Text('12efewfefwe3'),
                        ),
                        HomeMainGrid(data),
                      ],
                    ),
                  ),
                  onNotification: (notificationInfo) {
                    // ignore: avoid_print
                    print(notificationInfo.direction);
                    return true;
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
