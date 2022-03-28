import 'package:flutter/material.dart';
import '../../models/ui/models/home_upper_button_section_data.dart';
import 'package:flutterwebview/generated/l10n.dart';

class HomeUpperButtonSection extends StatelessWidget {
  final List<HomeUpperButtonSectionData> buttonList = [
    HomeUpperButtonSectionData(text: S.current.recommendation, id: 0),
    HomeUpperButtonSectionData(text: S.current.new_show, id: 1),
    HomeUpperButtonSectionData(text: S.current.pretty, id: 2),
    HomeUpperButtonSectionData(text: S.current.new_star, id: 3),
    HomeUpperButtonSectionData(text: S.current.dancing, id: 4),
    HomeUpperButtonSectionData(text: S.current.friendship, id: 5),
    HomeUpperButtonSectionData(text: S.current.music, id: 6),
    HomeUpperButtonSectionData(text: S.current.godness, id: 7)
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
