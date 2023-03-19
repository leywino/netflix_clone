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
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/eU1i6eHXlzMOlEq0ku1Rzq7Y4wA.jpg",
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
