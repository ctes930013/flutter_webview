import 'package:flutter/material.dart';
import 'package:flutterwebview/components/data/generate_data.dart';
import 'package:flutterwebview/components/data/home_grid_data.dart';

class HomeGrid extends StatefulWidget{

  @override
  State createState() => HomeGridState();
}

class HomeGridState extends State<HomeGrid>{
  @override
  Widget build(BuildContext context) {
    //先取得資料
    List data = GenerateData.getListData();
    return GridView.builder(
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index){
          HomeGridData homeGridData = data[index];    //根據索引取得對應的資料
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
    );
  }
  
}