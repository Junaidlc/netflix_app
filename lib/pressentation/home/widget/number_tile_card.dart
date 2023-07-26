import 'package:flutter/material.dart';
import 'package:netflix/pressentation/home/widget/number_card.dart';
import 'package:netflix/pressentation/widgets/main_tiltle.dart';

class NumberTileCard extends StatelessWidget {
  const NumberTileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: MainTitle(
            title: "Top 10 TV Shows in India Today",
          ),
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => NumberCard(
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
