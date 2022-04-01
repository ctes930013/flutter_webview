import 'package:flutter/material.dart';

//進度圈
class ProgressWidget extends StatelessWidget {
  const ProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: const Center(child: CircularProgressIndicator()),
      );
  }
}