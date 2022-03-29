import 'package:flutter/material.dart';
import 'package:flutterwebview/pages/splash.dart';
import 'components/index.dart';

class InitializationApp extends StatefulWidget {
  const InitializationApp({Key? key}) : super(key: key);

  @override
  State<InitializationApp> createState() => InitializationAppState();
}

class InitializationAppState extends State<InitializationApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 4)),    //先停留幾秒在啟動頁之後再導去首頁
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          return const Index(index: "0");
        } else {
          return const Splash();
        }
      },
    );
  }
}
