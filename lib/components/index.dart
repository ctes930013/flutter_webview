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
  late int index;
  List<Widget> pages = [
    HomeMain(),
    HomeComponent(),
    HomeComponent(),
    HomeComponent()
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HomeBottomBarItemImage homeBottomBarItemImage = HomeBottomBarItemImage();

    index = int.parse(widget.index);
    return Scaffold(
      //下方tab
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (index) {
          // this.index = index;
          // setState(() {
          //
          // });
          //倘若當前頁面與點選的頁面相同不做處理
          if(index != this.index){
            //使用fluro路由切換頁面
            Application.router.navigateTo(
              context,
              Routes.index + "?index=" + index.toString(), //將點選的頁數傳入路由,
              transition: getTransitionType(index),
              replace: true, //替換下一頁為當前頁面
            );
          }
        },
        items: getCurrentBottomBar(),
      ),
      body: pages[index],
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
  List<BottomNavigationBarItem> getCurrentBottomBar(){
    HomeBottomBarItemImage homeBottomBarItemImage = HomeBottomBarItemImage();
    if(index == 0){
      //焦點在首頁
      return [
        homeBottomBarItemImage.setFirstPageItemGif(),
        homeBottomBarItemImage.setSecondPageItem(),
        homeBottomBarItemImage.setThirdPageItem(),
        homeBottomBarItemImage.setFourthPageItem(),
      ];
    }else if(index == 1){
      //焦點在第二頁
      return [
        homeBottomBarItemImage.setFirstPageItem(),
        homeBottomBarItemImage.setSecondPageItemGif(),
        homeBottomBarItemImage.setThirdPageItem(),
        homeBottomBarItemImage.setFourthPageItem(),
      ];
    }else if(index == 2){
      //焦點在第三頁
      return [
        homeBottomBarItemImage.setFirstPageItem(),
        homeBottomBarItemImage.setSecondPageItem(),
        homeBottomBarItemImage.setThirdPageItemGif(),
        homeBottomBarItemImage.setFourthPageItem(),
      ];
    }else{
      //焦點在最後一頁
      return [
        homeBottomBarItemImage.setFirstPageItem(),
        homeBottomBarItemImage.setSecondPageItem(),
        homeBottomBarItemImage.setThirdPageItem(),
        homeBottomBarItemImage.setFourthPageItemGif(),
      ];
    }
  }
}
