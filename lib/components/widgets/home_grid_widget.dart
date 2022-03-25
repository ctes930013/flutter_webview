import 'package:flutter/material.dart';
import 'package:flutterwebview/models/models/home_grid_data.dart';

//首頁gridview的內部子元件
class HomeGridWidget extends StatelessWidget {
  final HomeGridData homeGridData;
  const HomeGridWidget({Key? key, required this.homeGridData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: const EdgeInsets.all(3),
      child: Stack(
        children: [
          Image.asset(
            homeGridData.img,
            width: MediaQuery.of(context).size.width, //滿版
            height: MediaQuery.of(context).size.height, //滿版
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Stack(
              children: [
                //標題
                Text(
                  homeGridData.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Stack(
                    children: [
                      //作者
                      Text(
                        homeGridData.author,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        //位置
                        child: Text(
                          homeGridData.locate,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        //觀看數量
                        child: Text(
                          homeGridData.count.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
