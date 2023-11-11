import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/pressentation/home/widget/background_card.dart';
import 'package:netflix/pressentation/home/widget/number_tile_card.dart';
import 'package:netflix/pressentation/widgets/main_tile_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
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
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  } else if (state.hasError) {
                    return const Center(
                      child: Text(
                        "Error While Getting Data",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                  // released past yeat
                  final _releasePastYear = state.pastYearMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  // trending now
                  final _tranding = state.trandingMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  // tense drama
                  final _tenseDrama = state.tenseDramaMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  // south indian
                  final _southIndian = state.southIndiaMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _southIndian.shuffle();
                  // top 10 tv shows
                  final _top10tvShows = state.trandingTVList.map((t) {
                    return '$imageAppendUrl${t.posterPath}';
                  }).toList();
                  _top10tvShows.shuffle();
                  // List View
                  return ListView(
                    children: [
                      BackgroundCard(),
                      MainTileCard(
                        title: "Released in Past Year",
                        posterList: _releasePastYear,
                      ),
                      MainTileCard(
                        title: "Trending Now",
                        posterList: _tranding,
                      ),
                      NumberTileCard(
                        postersList: _top10tvShows.sublist(0, 10),
                      ),
                      MainTileCard(
                        title: "Tense Dramas",
                        posterList: _tenseDrama,
                      ),
                      MainTileCard(
                        title: "South Indian Cinema",
                        posterList: _southIndian,
                      ),
                    ],
                  );
                },
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
