import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/home/widgets/main_card2.dart';
import 'package:netflix/presentation/home/widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: const [
            MainTitleCard(
              title: "Released in the Past Year",
            ),
            MainTitleCard(
              title: "Trending Now",
            ),
            MainTitleCard2(title: "Top 10 TV shows in India today"),
            MainTitleCard(
              title: "Tense Dramas",
            ),
            MainTitleCard(
              title: "South Indian Cinemas",
            ),
          ],
        ),
      ),
    );
  }
}
