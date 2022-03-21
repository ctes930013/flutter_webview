import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutterwebview/config/application.dart';
import 'package:flutterwebview/config/routes.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Tab A'),
  Tab(text: 'Tab B'),
  Tab(text: 'Tab C'),
];

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  void routerHandler(context, routesName) {
    Application.router.navigateTo(context, routesName);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const TabBar(
              tabs: tabs,
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () => routerHandler(context, Routes.search),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.yellow,
                  )),
              IconButton(
                  onPressed: () => routerHandler(context, Routes.ranking),
                  icon: const Icon(
                    Icons.military_tech,
                    color: Colors.lightGreenAccent,
                  )),
            ],
          ),
          body: const TabBarView(children: <Widget>[
            Center(child: Text('tab A')),
            Center(child: Text('tab B')),
            Center(child: Text('tab C')),
          ]),
        ));
  }
}
