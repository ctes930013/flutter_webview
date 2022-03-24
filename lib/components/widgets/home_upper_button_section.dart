import 'package:flutter/material.dart';

class HomeUpperButtonSection extends StatelessWidget {
  const HomeUpperButtonSection({Key? key}) : super(key: key);

  static const buttonTxts = ['推薦', '星秀', '顏值', '新人', '舞蹈', '交友', '音樂', '女神'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: buttonTxts.map((txt) {
          return ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
            onPressed: null,
            child: Text(txt),
          );
        }).toList(),
      ),
    );
  }
}
