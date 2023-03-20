import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/main_card.dart';
import 'package:netflix/presentation/home/widgets/title.dart';

class MainTitleCard2 extends StatelessWidget {
  const MainTitleCard2({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          MainTitle(
            title: title,
          ),
          kHeight,
          LimitedBox(
            maxHeight: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => Container(
                  width: 180,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 10,
                        child: MainCard(),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 5,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: BorderedText(
                            strokeWidth: 10.0,
                            strokeColor: Colors.white,
                            child: Text(
                              "${index + 1}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 90,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                decorationColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}