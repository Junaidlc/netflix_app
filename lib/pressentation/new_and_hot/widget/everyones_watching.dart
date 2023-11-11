import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/pressentation/home/widget/custom_button_widget.dart';
import 'package:netflix/pressentation/widgets/video_widget.dart';

class EveryonesWatching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatching({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
         Text(
          movieName,
          style: kTextStyleBold24,
        ),
        kHeight,
         Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: kTextStyleRegularGrey14,
        ),
        kHeight50,
        VideoWidget(
          url: posterPath,
        ),
        kHeight,
        const Row(
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
