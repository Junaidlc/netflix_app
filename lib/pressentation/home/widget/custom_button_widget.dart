import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart'; 

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.icon,
    this.iconSize = 30,
    this.textSize = 18,
  });
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: kWhiteColor,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textSize,
          ),
        )
      ],
    );
  }
}
