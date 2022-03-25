import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    brightness: Brightness.light,
    indicatorColor: Colors.amber,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    indicatorColor: Colors.blueGrey,
  );
}
