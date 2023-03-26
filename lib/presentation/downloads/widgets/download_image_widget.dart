import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';

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
