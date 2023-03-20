import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widget/title.dart';

const imageUrl =
    "https://scontent.fcok14-1.fna.fbcdn.net/v/t1.6435-9/55485863_10157472280527275_7877149838259781632_n.jpg?stp=dst-jpg_p180x540&_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=nP2GAV6TYfEAX9H8CYH&_nc_ht=scontent.fcok14-1.fna&oh=00_AfBLfP52N7BOKotN5a9pSOvWDvNn2HE9aJxBn7E_eOHhKA&oe=643E7311";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SearchTitleWidget(title: "Top Searches"),
          ),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const TopSearchItemTile(),
              separatorBuilder: (context, index) => kHeight,
              itemCount: 10)
        ],
      ),
    ));
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: screenWidth / 3,
              height: screenWidth / 5.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            kWidth,
            Container(
              height: screenWidth / 5.3,
              width: screenWidth / 2.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Avengers: Endgame",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Icon(
          Icons.play_circle_outline,
          color: Colors.white,
          size: 35,
        )
      ],
    );
  }
}
