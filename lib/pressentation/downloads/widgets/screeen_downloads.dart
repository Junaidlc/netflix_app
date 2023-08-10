import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/pressentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartDownload(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          ),
        ),
        body: ListView.separated(
            itemBuilder: (cxt, index) => _widgetList[index],
            separatorBuilder: (cxt, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   BlocProvider.of<DownloadsBloc>(context)
    //       .add(DownloadsEvent.getDownloadsImages());
    // });
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImages());
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: kTextStyleBold24,
        ),
        kHeight,
        const Text(
          "We will download a personalised section of\n movies and shows for you,So there's\n always something to watch on your\n device",
          textAlign: TextAlign.center,
          style: kTextStyleBoldGrey16,
        ),
        kHeight40,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.downloads.isEmpty
                      ? const SizedBox()
                      : Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: size.width * 0.38,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                            ),
                            DownloadsImageWidget(
                              imageList:
                                  '$imageAppendUrl${state.downloads[0].posterPath}',
                              margin: const EdgeInsets.only(
                                left: 130,
                              ),
                              angle: 20,
                              size: Size(size.width * 0.44, size.width * 0.48),
                            ),
                            DownloadsImageWidget(
                              imageList:
                                  '$imageAppendUrl${state.downloads[1].posterPath}',
                              margin: const EdgeInsets.only(
                                right: 130,
                              ),
                              angle: -20,
                              size: Size(size.width * 0.44, size.width * 0.48),
                            ),
                            DownloadsImageWidget(
                              imageList:
                                  '$imageAppendUrl${state.downloads[2].posterPath}',
                              margin:
                                  const EdgeInsets.only(left: 0, bottom: 10),
                              size: Size(size.width * 0.38, size.width * 0.56),
                            ),
                          ],
                        ),
            );
          },
        ),
        kHeight40,
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        MaterialButton(
          color: kBottonColorBlue,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 120),
            child: Text("Set Up", style: kTextStyleBold20),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kWhiteColor,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: kTextStyleBold18,
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imageList,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class _SmartDownload extends StatelessWidget {
  const _SmartDownload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: Row(
        children: [
          Icon(Icons.settings_outlined, color: Colors.white),
          kWidth,
          Text(
            "Smart Downloads",
            style: kTextStyleBold16,
          )
        ],
      ),
    );
  }
}
