import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/pressentation/new_and_hot/widget/coming_soon.dart';
import 'package:netflix/pressentation/new_and_hot/widget/everyones_watching.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: kWhiteColor,
                size: 30,
              ),
              kWidth,
              Container(
                color: Colors.blue,
                width: 30,
                height: 30,
              ),
              kWidth,
            ],
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: kWhiteColor,
              labelColor: kBlackColor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(
                  text: '🍿 Coming soon',
                ),
                Tab(text: "👀 Everyone's Watching")
              ],
              indicator: BoxDecoration(
                color: kWhiteColor,
                borderRadius: kRadius30,
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
          _buildComingSoon(),
          _buildEveryOnesWatching(),
        ]),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
    );
  }

  Widget _buildEveryOnesWatching() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) =>
            const EveryonesWatching());
  }
}
