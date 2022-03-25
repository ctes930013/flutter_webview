import 'package:flutter/material.dart';
import '../../components/data/home_upper_button_data.dart';

class HomeUpperButtonSection extends StatelessWidget {
  const HomeUpperButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeUpperButtonData data = HomeUpperButtonData();
    var buttonList = data.getButtonList();

    return SizedBox(
      height: 33,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(4),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
              onPressed: null,
              child: Text(buttonList[index].text),
            ),
          );
        },
        itemCount: buttonList.length,
      ),
    );
  }
}
