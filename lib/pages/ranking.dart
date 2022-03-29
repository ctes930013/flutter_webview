import 'package:flutter/material.dart';
import 'package:flutterwebview/generated/l10n.dart';

class Ranking extends StatelessWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).rank),
      ),
      body: Center(child: Text(S.of(context).rank)),
    );
  }
}
