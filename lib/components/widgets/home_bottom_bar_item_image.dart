import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/config/api.dart';
import 'package:flutterwebview/config/constants.dart';

class HomeBottomBarItemImage{

  //取得第一頁動態
  BottomNavigationBarItem setFirstPageItemGif(){
    return BottomNavigationBarItem(
        icon: CachedNetworkImage(
          imageUrl: API.apiUrl + "img/arrow_top.85cad4f9.webp",
          //加載中預覽圖
          placeholder: (context, url) =>
              Center(child: Image.asset(
                'lib/images/loading.gif',
                height: Constants.bottomNavImgHeight,
              ),),
          //加載失敗預覽圖
          errorWidget: (context, url, error) =>
          const Center(child:
          Icon(Icons.error)
          ),
          height: Constants.bottomNavImgHeight,
        ),
        label: 'webp'
    );
  }

  //取得第二頁動態
  BottomNavigationBarItem setSecondPageItemGif(){
    return BottomNavigationBarItem(
        icon: CachedNetworkImage(
          imageUrl: API.apiUrl + "img/arrow_bottom.e49e7d70.webp",
          placeholder: (context, url) =>
              Center(child: Image.asset(
                'lib/images/loading.gif',
                height: Constants.bottomNavImgHeight,
              ),),
          errorWidget: (context, url, error) =>
          const Center(child:
          Icon(Icons.error)
          ),
          height: Constants.bottomNavImgHeight,
        ),
        label: 'webp'
    );
  }

  //取得第三頁動態
  BottomNavigationBarItem setThirdPageItemGif(){
    return BottomNavigationBarItem(
        icon: CachedNetworkImage(
          imageUrl: API.apiUrl + "img/arrow_left.a3fbba75.gif",
          placeholder: (context, url) =>
              Center(child: Image.asset(
                'lib/images/loading.gif',
                height: Constants.bottomNavImgHeight,
              ),),
          errorWidget: (context, url, error) =>
          const Center(child:
          Icon(Icons.error)
          ),
          height: Constants.bottomNavImgHeight,
        ),
        label: 'gif'
    );
  }

  //取得第四頁動態
  BottomNavigationBarItem setFourthPageItemGif(){
    return BottomNavigationBarItem(
        icon: CachedNetworkImage(
          imageUrl: API.apiUrl + "img/arrow_right.5a0b7bb6.gif",
          placeholder: (context, url) =>
              Center(child: Image.asset(
                'lib/images/loading.gif',
                height: Constants.bottomNavImgHeight,
              ),),
          errorWidget: (context, url, error) =>
          const Center(child:
          Icon(Icons.error)
          ),
          height: Constants.bottomNavImgHeight,
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
        label: 'webp'
    );
  }

  //取得第四頁靜態
  BottomNavigationBarItem setFourthPageItem(){
    return BottomNavigationBarItem(
        icon: Image.asset(
          'lib/images/arrow_right.png',
          height: Constants.bottomNavImgHeight,
        ),
        label: 'webp'
    );
  }
}