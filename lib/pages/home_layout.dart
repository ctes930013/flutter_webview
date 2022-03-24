import 'package:flutter/material.dart';
import '../components/gridview/home_grid.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: HomeGrid(),
    // );
    return Column(
      children: const <Widget>[
        Text('123'),
        HomeGrid(),
      ],
    );
  }
}
