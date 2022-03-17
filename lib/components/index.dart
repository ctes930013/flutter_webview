import 'dart:math';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/components/homepage/home_component.dart';
import 'package:flutterwebview/config/application.dart';
import 'package:flutterwebview/config/routes.dart';

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
    HomeComponent(),
    HomeComponent(),
    HomeComponent(),
    HomeComponent()
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    index = int.parse(widget.index);
    return Scaffold(
      //下方tab
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (index){
          // this.index = index;
          // setState(() {
          //
          // });
          //使用fluro路由切換頁面
          Application.router.navigateTo(
            context,
            Routes.index + "?index=" + index.toString(),    //將點選的頁數傳入路由,
            transition: getTransitionType(),
            clearStack: true,    //清除前幾頁
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首頁'),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: '時程'),
          BottomNavigationBarItem(icon: Icon(Icons.adb), label: '除錯'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '新增')
        ],
      ),
      body: pages[index],
    );
  }

  //隨機挑選過場動畫效果
  TransitionType getTransitionType(){
    var list = [
      TransitionType.inFromTop,
      TransitionType.inFromLeft,
      TransitionType.inFromBottom,
      TransitionType.inFromRight,
      TransitionType.fadeIn,
      TransitionType.cupertinoFullScreenDialog,
      TransitionType.cupertino
    ];
    var index = Random().nextInt(list.length);
    return list[index];
  }
}