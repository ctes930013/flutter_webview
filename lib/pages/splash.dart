//廣告啟動頁面
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';

class Splash extends StatefulWidget{
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: GifView.asset(
            'lib/images/turtle.gif',
            //loop: false,     //不要重複撥放
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(
            "幾秒後自動導到首頁",
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}