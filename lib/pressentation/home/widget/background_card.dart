import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/pressentation/home/widget/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                kMainImage,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  title: "My List",
                  icon: Icons.add,
                ),
                _PlayButton(),
                const CustomButtonWidget(
                  title: "Info",
                  icon: Icons.info_sharp,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlackColor,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          kWhiteColor,
        ),
      ),
      label: const Text(
        'Play  ',
        style: TextStyle(
          fontSize: 20,
          color: kBlackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
