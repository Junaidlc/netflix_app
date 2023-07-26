import 'package:flutter/material.dart';
import 'package:netflix/pressentation/downloads/widgets/screeen_downloads.dart';
import 'package:netflix/pressentation/fast_laughs/screen_fast_laughs.dart';
import 'package:netflix/pressentation/home/screen_home.dart';
import 'package:netflix/pressentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/pressentation/search/screen_search.dart';
import 'bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({Key? key}) : super(key: key);

   final _pages = [
     const ScreenHome(),
     const ScreenNewAndHot(),
     const ScreenfastLaugh(),
     const ScreenSearch(),
     ScreenDownloads(),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context,int intex, _) {
          return _pages[intex];
        },),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
