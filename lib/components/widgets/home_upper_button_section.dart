import 'package:flutter/material.dart';
import '../../models/ui/models/home_upper_button_section_data.dart';

class HomeUpperButtonSection extends StatelessWidget {
  final List<HomeUpperButtonSectionData> buttonList = [
    HomeUpperButtonSectionData(text: '推薦1', id: 0),
    HomeUpperButtonSectionData(text: '星秀', id: 1),
    HomeUpperButtonSectionData(text: '顏值', id: 2),
    HomeUpperButtonSectionData(text: '新人', id: 3),
    HomeUpperButtonSectionData(text: '舞蹈', id: 4),
    HomeUpperButtonSectionData(text: '交友', id: 5),
    HomeUpperButtonSectionData(text: '音樂', id: 6),
    HomeUpperButtonSectionData(text: '女神', id: 7)
  ];

  HomeUpperButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
            onPressed: null,
            child: Text(buttonList[index].text),
          );
        },
        itemCount: buttonList.length,
      ),
    );
  }
}
