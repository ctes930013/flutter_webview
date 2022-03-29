import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';

class HomeMarqueeWidget extends StatelessWidget {
  final String txt;
  const HomeMarqueeWidget({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setHeight(35),
      margin: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        //圓角的角度
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        //背景漸層色
        gradient: LinearGradient(
            colors: [Colors.purple, Colors.purpleAccent, Colors.lime]
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'lib/images/sound.png',
              height: ScreenUtil().setHeight(20),
            ),
          ),
          Expanded(
            flex: 8,
            child: Marquee(   //跑馬燈
              text: txt,
              style: const TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }

}