import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/pressentation/home/widget/custom_button_widget.dart';
import 'package:netflix/pressentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 18,
                  color: kGreyColor,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
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
          height: 500,
          child:  const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(videoImage: kTempNewAndHot),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                     Text(
                      "Indiana Jonas",
                      style: TextStyle(
                        letterSpacing: -4,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Row(
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
                "Coming on Friday",
                style: kTextStyleBoldGrey16,
              ),
              kHeight,
               SizedBox(
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
                "Indiana Jonas",
                style: kTextStyleBold24,
              ),
               Text(
                "Landing the lead in the school musical is a dream come true for Jod, until the pressure uinto e failspinsends her contidence and her relationship",
                style: kTextStyleRegularGrey14,
              ),
            ],
          ),
        )
      ],
    );
  }
}