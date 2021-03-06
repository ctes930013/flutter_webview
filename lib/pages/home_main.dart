import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterwebview/pages/checkout_language.dart';
import 'package:provider/provider.dart';

import 'package:flutterwebview/config/application.dart';
import 'package:flutterwebview/config/routes.dart';
import 'package:flutterwebview/providers/theme_provider.dart';
import '../pages/home_main_layout.dart';
import 'package:flutterwebview/generated/l10n.dart';

class HomeMain extends StatefulWidget {
  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  IconData toNightMode = Icons.shield_moon;
  IconData toLightMode = Icons.sunny;

  void routerHandler(context, routesName) {
    Application.router.navigateTo(context, routesName,
        transition: TransitionType.inFromRight);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider provider = Provider.of<ThemeProvider>(context, listen: false);
    bool isNightMode = provider.isNightMode;

    List<Tab> tabs = <Tab>[
      Tab(
        text: S.of(context).index,
        height: 30,
      ),
      Tab(
        text: S.of(context).language,
        height: 30,
      ),
      const Tab(
        text: 'Tab C',
        height: 30,
      ),
    ];

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
              labelStyle: const TextStyle(fontSize: 16),
              unselectedLabelStyle: const TextStyle(fontSize: 12),
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
            const Center(
              child: HomeMainLayout(),
            ),
            const Center(child: CheckoutLanguage()),
            Center(child: Text(S.of(context).tab_c)),
          ]),
        ));
  }
}
