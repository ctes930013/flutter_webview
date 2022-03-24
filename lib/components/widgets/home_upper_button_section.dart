import 'package:flutter/material.dart';

class HomeUpperButtonSection extends StatelessWidget {
  const HomeUpperButtonSection({Key? key}) : super(key: key);

  static List<ElevatedButton> buttonsList = <ElevatedButton>[
    const ElevatedButton(
      onPressed: null,
      child: Text('123'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
