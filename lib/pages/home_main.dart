import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:flutterwebview/components/gridview/home_grid.dart';
import 'package:flutterwebview/config/application.dart';
import 'package:flutterwebview/config/routes.dart';
import 'package:flutterwebview/providers/theme_provider.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Tab A'),
  Tab(text: 'Tab B'),
  Tab(text: 'Tab C'),
];

class HomeMain extends StatefulWidget {
  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  bool isNightMode = false;
  IconData toNightMode = Icons.shield_moon;
  IconData toLightMode = Icons.sunny;

  void routerHandler(context, routesName) {
    Application.router.navigateTo(context, routesName);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              // indicatorColor: Colors.amber,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 4,
                    color: Theme.of(context).indicatorColor,
                    // color: Colors.indigo,
                  ),
                  insets: const EdgeInsets.symmetric(
                    horizontal: 35,
                  )),
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
              IconButton(
                onPressed: () {
                  setState(() {
                    isNightMode = !isNightMode;
                    ThemeProvider provider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    provider.setNightMode(isNightMode);
                    print(Provider.of<ThemeProvider>(context, listen: false));
                  });
                },
                icon: isNightMode
                    ? Icon(
                        toLightMode,
                        color: Colors.white,
                      )
                    : Icon(
                        toNightMode,
                        color: Colors.white,
                      ),
              ),
            ],
          ),
          body: TabBarView(children: <Widget>[
            Center(child: HomeGrid()),
            Center(child: Text('tab B')),
            Center(child: Text('tab C')),
          ]),
        ));
  }
}
