import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/components/data/home_grid_data.dart';

//首頁gridview的內部子元件
class HomeGridWidget extends StatelessWidget{

  final HomeGridData homeGridData;
  const HomeGridWidget({Key? key, required this.homeGridData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: const EdgeInsets.all(3),
      child: Stack(
        children: [
          Image.asset(
            homeGridData.img,
            width: MediaQuery.of(context).size.width,       //滿版
            height: MediaQuery.of(context).size.height,     //滿版
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Stack(
              children: [
                Text(
                  homeGridData.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Stack(
                    children: [
                      Text(
                        homeGridData.author,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          homeGridData.locate,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    homeGridData.count.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14
                    ),
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