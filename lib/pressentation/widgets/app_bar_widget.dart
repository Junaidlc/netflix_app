import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
        const Spacer(),
        const Icon(Icons.cast, color: kWhiteColor, size: 30),
        kWidth,
        Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        ),
        kWidth,
      ],
    );
  }
}
