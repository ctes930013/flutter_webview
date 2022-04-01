import 'package:flutter/material.dart';

//底部資料加載完成提示
class DataLoadFinishWidget extends StatelessWidget {

  final String txt;
  const DataLoadFinishWidget({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
          txt,
          style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
          ),
      ),
    );
  }
}