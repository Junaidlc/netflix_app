import 'package:flutter/material.dart';
import 'package:netflix/pressentation/widgets/main_card.dart';
import 'package:netflix/pressentation/widgets/main_tiltle.dart';

class MainTileCard extends StatelessWidget {
  const MainTileCard({
    super.key,
    required this.title, required this.posterList,
  });
  final String title;
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: MainTitle(
            title: title,
          ),
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterList.length,
              (index) =>  MainCard(imageUrl: posterList[index]),
            ),
          ),
        ),
      ],
    );
  }
}
