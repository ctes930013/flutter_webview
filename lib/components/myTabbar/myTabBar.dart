import 'package:flutter/material.dart';
import 'package:flutterwebview/components/gridview/home_grid.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Tab A'),
  Tab(text: 'Tab B'),
  Tab(text: 'Tab C'),
];

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(children: <Widget>[
            Center(child: HomeGrid()),
            Center(child: Text('tab B')),
            Center(child: Text('tab C')),
          ]),
        ));
  }
}
