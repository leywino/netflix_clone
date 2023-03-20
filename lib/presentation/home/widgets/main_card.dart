import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 120,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://assets-prd.ignimgs.com/2023/01/24/shzam2-vert-main-2764x4096-dom-1674589983500.jpg"),
          ),
        ),
      ),
    );
  }
}
