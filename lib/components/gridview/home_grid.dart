import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterwebview/components/data/generate_data.dart';
import 'package:flutterwebview/components/data/home_grid_data.dart';
import 'package:flutterwebview/components/widgets/home_grid_widget.dart';

//首頁的gridview
class HomeGrid extends StatefulWidget {
  const HomeGrid({Key? key}) : super(key: key);

  @override
  State createState() => HomeGridState();
}

class HomeGridState extends State<HomeGrid> {

  //定義stream控制器
  StreamController<List<HomeGridData>> gridStreamController = StreamController();
  //定義資料總筆數
  int total = 10;

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
    return RefreshIndicator(
      //下拉刷新的處理事件
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));    //delay
        gridStreamController.sink.add(generateData.getListData(total));
        return Future.value();
      },
      //利用下拉刷新加上stream builder
      child: StreamBuilder(
        initialData: generateData.getListData(total),   //初始值
        stream: gridStreamController.stream,
        builder: (BuildContext context, AsyncSnapshot<List<HomeGridData>> snapshot) {
          List<HomeGridData> data = snapshot.data ?? [];    //get data
          return GridView.builder(
              itemCount: data.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                HomeGridData homeGridData = data[index]; //根據索引取得對應的資料
                return HomeGridWidget(
                  homeGridData: homeGridData,
                );
              }
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    gridStreamController.close();
  }
}
