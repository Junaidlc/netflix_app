import 'package:flutter/material.dart';
import 'package:netflix/pressentation/fast_laughs/widget/video_list_item.dart';

class ScreenfastLaugh extends StatelessWidget {
  const ScreenfastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(10, (index) {
            return VideoListItem(
              index: index,
            );
          }),
        ),
      ),
    );
  }
}
