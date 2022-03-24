import 'package:flutter/material.dart';
import 'package:flutterwebview/pages/checkout_language.dart';
import 'package:provider/provider.dart';

import 'package:flutterwebview/components/gridview/home_grid.dart';
import 'package:flutterwebview/config/application.dart';
import 'package:flutterwebview/config/routes.dart';
import 'package:flutterwebview/providers/theme_provider.dart';

const List<Tab> tabs = <Tab>[
  Tab(
    text: '首頁',
    height: 30,
  ),
  Tab(
    text: '語系',
    height: 30,
  ),
  Tab(
    text: 'Tab C',
    height: 30,
  ),
];

class HomeMain extends StatefulWidget {
  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  IconData toNightMode = Icons.shield_moon;
  IconData toLightMode = Icons.sunny;

  void routerHandler(context, routesName) {
    Application.router.navigateTo(context, routesName);
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: false);
    bool isNightMode = provider.isNightMode;

    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: TabBar(
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 4,
                    color: Theme.of(context).indicatorColor,
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
                    provider.setNightMode(isNightMode);
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
          body: const TabBarView(children: <Widget>[
            Center(child: HomeGrid()),
            Center(child: CheckoutLanguage()),
            Center(child: Text('tab C')),
          ]),
        ));
  }
}
