import 'package:flutter/material.dart';
import '../../components/data/home_upper_button_data.dart';

class HomeRecommendUpperSection extends StatelessWidget {
  const HomeRecommendUpperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeUpperButtonData data = HomeUpperButtonData();
    var buttonList = data.getReccommendButtonList();

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(8)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: null,
            child: Image.asset(
              buttonList[index].img,
            ),
          );
        },
        itemCount: buttonList.length,
      ),
    );
  }
}
