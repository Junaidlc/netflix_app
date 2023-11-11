import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/pressentation/home/widget/custom_button_widget.dart';
import 'package:netflix/pressentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  month,
                  style: const TextStyle(
                    fontSize: 18,
                    color: kGreyColor,
                  ),
                ),
                Text(
                  day,
                  style: const TextStyle(
                    letterSpacing: 8,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width - 50,
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(url: posterPath),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          movieName,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            // letterSpacing: 1,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // const Spacer(),
                      const Row(
                        children: [
                          CustomButtonWidget(
                            title: "Remind me",
                            icon: Icons.alarm_on_outlined,
                            iconSize: 25,
                            textSize: 10,
                          ),
                          kWidth20,
                          CustomButtonWidget(
                            title: "Info",
                            icon: Icons.info_outline,
                            iconSize: 25,
                            textSize: 11,
                          ),
                          kWidth30,
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  "Coming on $day $month",
                  style: kTextStyleBoldGrey16,
                ),
                kHeight,
                const SizedBox(
                  width: double.infinity,
                  height: 25,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        fit: BoxFit.fitWidth,
                        width: 25,
                        // height: 25,
                        image: NetworkImage(
                          "https://cdn.vox-cdn.com/thumbor/SEEvZdiXcs0CS-YbPj2gm6AJ8qc=/0x0:3151x2048/1400x1400/filters:focal(1575x1024:1576x1025)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png",
                        ),
                      ),
                      Center(
                        child: Text(
                          "FILM",
                          style: kTextStyleRegularGrey16,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  movieName,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: kTextStyleBold24,
                ),
                Text(
                  description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: kTextStyleRegularGrey14,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
