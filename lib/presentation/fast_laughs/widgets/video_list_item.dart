import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //left side
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_off,
                  color: Colors.white,
                ),
              ),

              //right side

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://image.tmdb.org/t/p/original/5ScPNT6fHtfYJeWBajZciPV3hEL.jpg"),
                      radius: 27,
                    ),
                  ),
                  VideoActionsWidget(icon: Icons.emoji_emotions, title: "LOL"),
                  VideoActionsWidget(icon: Icons.add, title: "My List"),
                  VideoActionsWidget(icon: Icons.share, title: "Share"),
                  VideoActionsWidget(icon: Icons.play_arrow, title: "Play"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  VideoActionsWidget({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(color: kWhiteColor, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
