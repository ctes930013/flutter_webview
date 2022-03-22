import 'package:flutter/material.dart';
import 'package:flutterwebview/components/data/generate_data.dart';
import 'package:flutterwebview/components/data/home_grid_data.dart';
import 'package:flutterwebview/components/widgets/home_grid_widget.dart';

//首頁的gridview
class HomeGrid extends StatefulWidget{

  const HomeGrid({Key? key}) : super(key: key);

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
          return HomeGridWidget(homeGridData: homeGridData,);
        }
    );
  }
  
}