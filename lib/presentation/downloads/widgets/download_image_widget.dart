import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

// ignore: must_be_immutable
class DownloadImageRotate extends StatelessWidget {
  DownloadImageRotate({
    super.key,
    required this.index,
    this.angle,
    this.edge,
    this.downloadHeight,
    this.downloadWidth,
    required this.imageUrl,
  });

  final int? angle;
  final int? index;
  num? downloadHeight;
  double? downloadWidth;
  final EdgeInsets? edge;
  final String? imageUrl;

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
              image: NetworkImage(imageUrl!),
            ),
          ),
        ),
      ),
    );
  }
}
