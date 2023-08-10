import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    required this.videoImage,
    super.key,
  });
  final String videoImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 180,
          child: Image.network(
            videoImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
