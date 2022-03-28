import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/config/routes.dart';

import 'package:flutterwebview/components/homepage/home_component.dart';
import 'package:flutterwebview/config/application.dart';
import '../pages/home_main.dart';
import 'widgets/home_bottom_bar_item_image.dart';

class Index extends StatefulWidget {
  //接收傳入的頁數
  final String index;

  const Index({Key? key, required this.index}) : super(key: key);

  @override
  State createState() => IndexState();
}

class IndexState extends State<Index> {
  //紀錄傳入的頁數
  int index = 0;
  List<Widget> pages = [
    HomeMain(),
    HomeComponent(),
    HomeComponent(),
    HomeComponent()
  ];
  HomeBottomBarItemImage homeBottomBarItemImage = HomeBottomBarItemImage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //index = int.parse(widget.index);
    return
      FutureBuilder<List<BottomNavigationBarItem>>(   //get remote bottom bar icon
        future: getCurrentBottomBar(),
        builder: (context, snap){
          return Scaffold(
            //下方tab
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              currentIndex: index,
              onTap: (index) {
                setState(() {
                  this.index = index;
                });
                //倘若當前頁面與點選的頁面相同不做處理
                // if(index != this.index){
                //   //使用fluro路由切換頁面
                //   Application.router.navigateTo(
                //     context,
                //     Routes.index + "?index=" + index.toString(), //將點選的頁數傳入路由,
                //     transition: getTransitionType(index),
                //     replace: true, //替換下一頁為當前頁面
                //   );
                // }
              },
              items: snap.data ?? getDefaultBottomBar(),
            ),
            body: IndexedStack(    //保持頁面原始操作狀態
              index: index,
              children: pages,
            ),
          );
        },
      );
  }

  //挑選過場動畫效果
  TransitionType getTransitionType(int index) {
    if (index == 0) {
      return TransitionType.inFromBottom;
    } else if (index == 1) {
      return TransitionType.inFromTop;
    } else if (index == 2) {
      return TransitionType.inFromRight;
    } else {
      return TransitionType.inFromLeft;
    }
  }

  //設定底部選單的圖像文字
  Future<List<BottomNavigationBarItem>> getCurrentBottomBar() async{
    if(index == 0){
      //焦點在首頁
      return [
        await homeBottomBarItemImage.setFirstPageItemGif(),
        homeBottomBarItemImage.setSecondPageItem(),
        homeBottomBarItemImage.setThirdPageItem(),
        homeBottomBarItemImage.setFourthPageItem(),
      ];
    }else if(index == 1){
      //焦點在第二頁
      return [
        homeBottomBarItemImage.setFirstPageItem(),
        await homeBottomBarItemImage.setSecondPageItemGif(),
        homeBottomBarItemImage.setThirdPageItem(),
        homeBottomBarItemImage.setFourthPageItem(),
      ];
    }else if(index == 2){
      //焦點在第三頁
      return [
        homeBottomBarItemImage.setFirstPageItem(),
        homeBottomBarItemImage.setSecondPageItem(),
        await homeBottomBarItemImage.setThirdPageItemGif(),
        homeBottomBarItemImage.setFourthPageItem(),
      ];
    }else{
      //焦點在最後一頁
      return [
        homeBottomBarItemImage.setFirstPageItem(),
        homeBottomBarItemImage.setSecondPageItem(),
        homeBottomBarItemImage.setThirdPageItem(),
        await homeBottomBarItemImage.setFourthPageItemGif(),
      ];
    }
  }

  //設定當還在抓取網路圖片時的預設bar
  List<BottomNavigationBarItem> getDefaultBottomBar(){
    return [
      homeBottomBarItemImage.getDefaultImg(),
      homeBottomBarItemImage.getDefaultImg(),
      homeBottomBarItemImage.getDefaultImg(),
      homeBottomBarItemImage.getDefaultImg(),
    ];
  }
}
