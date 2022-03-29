import 'package:flutter/material.dart';
import '../../components/data/home_upper_button_data.dart';
import 'package:flutterwebview/components/widgets/home_marquee_widget.dart';

class HomeRecommendUpperSection extends StatelessWidget {
  const HomeRecommendUpperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeUpperButtonData data = HomeUpperButtonData();
    var buttonList = data.getReccommendButtonList();

    return Column(
      children: [
        SizedBox(
          height: 100,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, mainAxisExtent: 40),
            itemBuilder: (context, index) {
              return ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(1)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: null,
                child: Image.asset(
                  buttonList[index].img,
                  fit: BoxFit.fill,
                ),
              );
            },
            itemCount: buttonList.length,
          ),
        ),
        const HomeMarqueeWidget(
            txt: "本平台為測試樣本本平台為測試樣本本平台為測試樣本本平台為測試樣本本平台為測試樣本"),
      ],
    );
  }
}
