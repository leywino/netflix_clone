import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class DownloadImageRotate extends StatelessWidget {
  DownloadImageRotate({
    super.key,
    required this.index,
    this.angle,
    this.edge,
    this.downloadHeight,
    this.downloadWidth,
  });

  final int? angle;
  final int? index;
  num? downloadHeight;
  double? downloadWidth;
  final EdgeInsets? edge;
  final _pics = [
    "https://image.tmdb.org/t/p/original/5ScPNT6fHtfYJeWBajZciPV3hEL.jpg",
    "https://lumiere-a.akamaihd.net/v1/images/mandalorian-poster-2_45ab56c3.jpeg?region=0,0,864,1280",
    "https://cdn.europosters.eu/image/750/posters/the-last-of-us-key-art-i127761.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: edge!,
      child: Transform.rotate(
        angle: angle! * pi / 180,
        child: Container(
          height: size.width * downloadHeight!,
          width: size.width * downloadWidth!,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kBlackColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(_pics[index!]),
            ),
          ),
        ),
      ),
    );
  }
}
