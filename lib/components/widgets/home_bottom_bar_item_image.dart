import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/config/api.dart';
import 'package:flutterwebview/config/constants.dart';
import 'package:gif_view/gif_view.dart';
import 'package:http/http.dart' as http;

class HomeBottomBarItemImage{

  //存放四個網路圖片的data
  Uint8List? firstBytes;
  Uint8List? secondBytes;
  Uint8List? thirdBytes;
  Uint8List? fourthBytes;

  //取得第一頁動態
  Future<BottomNavigationBarItem> setFirstPageItemGif() async{
    //只有當第一次加載的時候才去抓網路圖片
    firstBytes ??= await getNetImg(API.apiUrl + "img/arrow_top.85cad4f9.webp");
    return BottomNavigationBarItem(
        icon: GifView.memory(
          firstBytes!,
          height: Constants.bottomNavImgHeight,
          loop: false,     //不要重複撥放
        ),
        label: 'webp'
    );
  }

  //取得第二頁動態
  Future<BottomNavigationBarItem> setSecondPageItemGif() async{
    secondBytes ??= await getNetImg(API.apiUrl + "img/arrow_bottom.e49e7d70.webp");
    return BottomNavigationBarItem(
        icon: GifView.memory(
          secondBytes!,
          height: Constants.bottomNavImgHeight,
          loop: false,     //不要重複撥放
        ),
        label: 'webp'
    );
  }

  //取得第三頁動態
  Future<BottomNavigationBarItem> setThirdPageItemGif() async{
    thirdBytes ??= await getNetImg(API.apiUrl + "img/arrow_left.a3fbba75.gif");
    return BottomNavigationBarItem(
        icon: GifView.memory(
          thirdBytes!,
          height: Constants.bottomNavImgHeight,
          loop: false,     //不要重複撥放
        ),
        label: 'gif'
    );
  }

  //取得第四頁動態
  Future<BottomNavigationBarItem> setFourthPageItemGif() async{
    fourthBytes ??= await getNetImg(API.apiUrl + "img/arrow_right.5a0b7bb6.gif");
    return BottomNavigationBarItem(
        icon: GifView.memory(
          fourthBytes!,
          height: Constants.bottomNavImgHeight,
          loop: false,     //不要重複撥放
        ),
        label: 'gif'
    );
  }


  //取得第一頁靜態
  BottomNavigationBarItem setFirstPageItem(){
    return BottomNavigationBarItem(
        icon: Image.asset(
            'lib/images/arrow_top.png',
            height: Constants.bottomNavImgHeight,
        ),
        label: 'webp'
    );
  }

  //取得第二頁靜態
  BottomNavigationBarItem setSecondPageItem(){
    return BottomNavigationBarItem(
        icon: Image.asset(
          'lib/images/arrow_bottom.png',
          height: Constants.bottomNavImgHeight,
        ),
        label: 'webp'
    );
  }

  //取得第三頁靜態
  BottomNavigationBarItem setThirdPageItem(){
    return BottomNavigationBarItem(
        icon: Image.asset(
          'lib/images/arrow_left.png',
          height: Constants.bottomNavImgHeight,
        ),
        label: 'gif'
    );
  }

  //取得第四頁靜態
  BottomNavigationBarItem setFourthPageItem(){
    return BottomNavigationBarItem(
        icon: Image.asset(
          'lib/images/arrow_right.png',
          height: Constants.bottomNavImgHeight,
        ),
        label: 'gif'
    );
  }

  //抓取網路上的圖片並轉為bytes
  Future<Uint8List> getNetImg(String url) async{
    http.Response response = await http.get(
      Uri.parse(url),
    );

    Uint8List data = response.bodyBytes;
    return data;
  }

  //預設的進度圈
  BottomNavigationBarItem getDefaultImg(){
    return BottomNavigationBarItem(
        icon: Center(child: Image.asset(
          'lib/images/loading.gif',
          height: Constants.bottomNavImgHeight,
        ),),
        label: ''
    );
  }
}