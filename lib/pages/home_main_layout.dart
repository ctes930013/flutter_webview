import 'dart:async';
import 'package:flutterwebview/components/widgets/data_load_finish_widget.dart';
import 'package:flutterwebview/components/widgets/home_banner_widget.dart';
import 'package:flutterwebview/components/widgets/progress_widget.dart';
import 'package:flutterwebview/generated/l10n.dart';
import 'package:flutterwebview/providers/home_load_more_provider.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
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

class HomeMainLayoutState extends State<HomeMainLayout> with AutomaticKeepAliveClientMixin {
  //定義stream控制器
  StreamController<List<HomeGridData>> gridStreamController =
      StreamController();
  //定義資料總筆數
  int total = 10;
  //定義資料最大總筆數
  int maxTotal = 40;

  //定義scroll控制器
  ScrollController scrollController = ScrollController();

  GenerateData generateData = GenerateData();
  List<HomeGridData> homeGridDataList = [];

  double lastDownY = 0;

  //保留tab切換後的狀態
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化grid data
    homeGridDataList = generateData.getListData(total);
    //初始化stream
    gridStreamController = StreamController<List<HomeGridData>>();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final HomeRecommendUpperSectionProvider provider =
        Provider.of<HomeRecommendUpperSectionProvider>(context, listen: false);

    final HomeLoadMoreProvider loadMoreProvider =
        Provider.of<HomeLoadMoreProvider>(context, listen: true);

    //監聽目前正在做底部加載
    bool isLoadMore = context.select((HomeLoadMoreProvider provider) => provider.loading);
    print("fuck");

    //下拉刷新
    return Column(
      children: [
        //首頁上方滾輪切換過場動畫
        //利用select監聽上方滾輪動畫
        Selector<HomeRecommendUpperSectionProvider, bool>(
          selector: (_, provider) => provider.scrollForward,
          builder: (context, scrollForward, child) {
            return AnimatedCrossFade (
              duration: const Duration(milliseconds: 500),
              firstChild: const HomeUpperButtonSection(),
              secondChild: const HomeRecommendUpperSection(),
              crossFadeState: !scrollForward ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            );
          },
        ),
        Expanded(
          child:
            //底部加載更多
            LazyLoadScrollView(
              //底部加載更多的處理方式
              onEndOfPage: () async {
                //倘若目前正在進行底部加載
                if(!isLoadMore){
                  loadMoreProvider.setLoadFinish(true);
                  await Future.delayed(const Duration(seconds: 2)); //delay
                  if(homeGridDataList.length < maxTotal){
                    //資料量已經超過最大筆數則不新增
                    homeGridDataList.addAll(generateData.getListData(total));  //產生新資料
                    gridStreamController.sink.add(homeGridDataList);
                  }
                  loadMoreProvider.setLoadFinish(false);
                }
              },
              child: RefreshIndicator(
                //下拉刷新的處理事件
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 2)); //delay
                  homeGridDataList = generateData.getListData(total);
                  gridStreamController.sink.add(homeGridDataList);
                  return Future.value();
                },
                //利用下拉刷新加上stream builder
                child: StreamBuilder(
                  initialData: homeGridDataList, //初始值
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
                            //banner
                            const HomeBannerWidget(),
                            HomeMainGrid(data),
                            //底部加載的進度圈
                            (isLoadMore) ? const ProgressWidget() : Container(),
                          ],
                        ),
                      ),
                      onPointerDown: (event) {
                        lastDownY = event.position.distance;
                      },
                      //控制首頁上方section根據滾輪上下切換
                      onPointerMove: (event) {
                        var position = event.position.distance;
                        double detal = 0;
                        if (lastDownY != 0) {
                          detal = position - lastDownY;
                        }
                        if (detal > 25) {
                          //顯示跑馬燈以及圖片
                          provider.setScrollForward(true);
                          lastDownY = position;
                        } else if (detal < -25) {
                          //顯示按鈕
                          provider.setScrollForward(false);
                          lastDownY = position;
                        }
                      },
                    );
                  },
                ),
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
