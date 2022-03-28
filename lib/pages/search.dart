import 'package:flutter/material.dart';
import 'package:flutterwebview/generated/l10n.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).search),
      ),
      body: Center(child: Text(S.of(context).search)),
    );
  }
}
