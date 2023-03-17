import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/downloads/widgets/download_image_widget.dart';
import 'package:netflix/presentation/widgets.dart/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          title: "Downloads",
        ),
        preferredSize: const Size.fromHeight(50),
      ),
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Row(
            children: const [
              Icon(
                Icons.settings,
                color: kWhiteColor,
              ),
              Text("Smart Downloads"),
            ],
          ),
          const Text("Indroducing Downloads for you"),
          const Text(
              "We will download a personalised selection of movies and shows for you, so there is always something to watch on your device"),
          Container(
            width: size.width,
            height: size.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: size.width * 0.37,
                  ),
                ),
                DownloadImageRotate(
                  index: 0,
                  angle: -20,
                  edge: EdgeInsets.only(right: 170, top: 60),
                  downloadHeight: 0.52,
                  downloadWidth: 0.33,
                ),
                DownloadImageRotate(
                  index: 1,
                  angle: 20,
                  edge: EdgeInsets.only(left: 170, top: 60),
                  downloadHeight: 0.52,
                  downloadWidth: 0.33,
                ),
                DownloadImageRotate(
                  index: 2,
                  angle: 0,
                  edge: EdgeInsets.only(left: 0),
                  downloadHeight: 0.65,
                  downloadWidth: 0.45,
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: kButtonColorBlue,
            child: const Text(
              "Set up",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: kButtonColorWhite,
            child: const Text(
              "See what you can download",
              style: TextStyle(
                color: kBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
