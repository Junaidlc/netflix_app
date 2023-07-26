import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/pressentation/home/widget/custom_button_widget.dart';
import 'package:netflix/pressentation/widgets/video_widget.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
         Text(
          "Friends",
          style: kTextStyleBold24,
        ),
        kHeight,
         Text(
          "Follow the lives of six reckless adults living in Manhattan, as they indulge in adventures which make their lives both troublesome and happening.",
          style: kTextStyleRegularGrey14,
        ),
        kHeight50,
         VideoWidget(
          videoImage: kTempNewAndHot1,
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtonWidget(
              title: "Share",
              icon: Icons.ios_share_rounded,
              iconSize: 30,
              textSize: 16,
            ),
            kWidth20,
            CustomButtonWidget(
              title: "My List",
              icon: Icons.add,
              iconSize: 30,
              textSize: 16,
            ),
            kWidth20,
            CustomButtonWidget(
              title: "Play",
              icon: Icons.play_arrow,
              iconSize: 30,
              textSize: 16,
            ),
            kWidth20,
          ],
        )
      ],
    );
  }
}
