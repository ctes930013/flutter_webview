import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/pages/checkout_language.dart';
import 'package:provider/provider.dart';

import 'package:flutterwebview/config/application.dart';
import 'package:flutterwebview/config/routes.dart';
import 'package:flutterwebview/providers/theme_provider.dart';
import '../pages/home_main_layout.dart';
import 'package:flutterwebview/generated/l10n.dart';

List<Tab> tabs = <Tab>[
  Tab(
    text: S.current.index,
    height: 30,
  ),
  Tab(
    text: S.current.language,
    height: 30,
  ),
  Tab(
    text: S.current.tab_c,
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
    Application.router.navigateTo(context, routesName, transition: TransitionType.inFromRight);
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
          body: TabBarView(children: <Widget>[
            // Center(child: HomeLayout()),
            const Center(
              child: HomeMainLayout(),
            ),
            const Center(child: CheckoutLanguage()),
            Center(child: Text(S.current.tab_c)),
          ]),
        ));
  }
}
