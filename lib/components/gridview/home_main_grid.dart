import 'package:flutter/material.dart';

import '../../models/models/home_grid_data.dart';
import '../../components/widgets/home_grid_widget.dart';

class HomeMainGrid extends StatefulWidget {
  List<HomeGridData> data;

  HomeMainGrid(this.data, {Key? key}) : super(key: key);

  @override
  State<HomeMainGrid> createState() => _HomeMainGridState();
}

class _HomeMainGridState extends State<HomeMainGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(), //disable scrolling
        shrinkWrap: true, //只占據所需大小
        itemCount: widget.data.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          HomeGridData homeGridData = widget.data[index]; //根據索引取得對應的資料
          return HomeGridWidget(
            homeGridData: homeGridData,
          );
        });
  }
}
