import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/pressentation/home/widget/background_card.dart';
import 'package:netflix/pressentation/home/widget/number_tile_card.dart';
import 'package:netflix/pressentation/widgets/main_tile_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackgroundCard(),
                  MainTileCard(
                    title: "Released in Past Year",
                  ),
                  MainTileCard(
                    title: "Trending Now",
                  ),
                  NumberTileCard(),
                  MainTileCard(
                    title: "Tense Dramas",
                  ),
                  MainTileCard(
                    title: "South Indian Cinema",
                  ),
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: Duration(seconds: 2),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://cdn.vox-cdn.com/thumbor/SEEvZdiXcs0CS-YbPj2gm6AJ8qc=/0x0:3151x2048/1400x1400/filters:focal(1575x1024:1576x1025)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png",
                                width: 50,
                                height: 50,
                              ),
                              const Spacer(),
                              const Icon(Icons.cast,
                                  color: kWhiteColor, size: 30),
                              kWidth,
                              Container(
                                color: Colors.blue,
                                width: 30,
                                height: 30,
                              ),
                              kWidth,
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'TV Shows',
                                style: kTextStyleBold14,
                              ),
                              Text(
                                'Moveis',
                                style: kTextStyleBold14,
                              ),
                              Text(
                                'Categories',
                                style: kTextStyleBold14,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight
            ],
          ),
        );
      },
    ));
  }
}
