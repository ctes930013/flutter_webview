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
            transition: getTransitionType(index),
            replace: true,    //替換下一頁為當前頁面
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_upward_sharp), label: 'inFromBottom'),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_downward_sharp), label: 'inFromTop'),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back_sharp), label: 'inFromRight'),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_forward_sharp), label: 'inFromLeft')
        ],
      ),
      body: pages[index],
    );
  }

  //挑選過場動畫效果
  TransitionType getTransitionType(int index){
    if(index == 0){
      return TransitionType.inFromBottom;
    }else if(index == 1){
      return TransitionType.inFromTop;
    }else if(index == 2){
      return TransitionType.inFromRight;
    }else{
      return TransitionType.inFromLeft;
    }
  }
}