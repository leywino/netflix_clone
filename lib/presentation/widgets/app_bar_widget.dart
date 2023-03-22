import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key, this.title});
  String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title!,
          style:
              GoogleFonts.montserrat(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Spacer(
          flex: 1,
        ),
        Icon(
          size: 30,
          Icons.cast,
          color: kWhiteColor,
        ),
        kWidth,
        Container(
          color: Colors.cyan,
          width: 25,
          height: 25,
        ),
        kWidth,
      ],
    );
  }
}
