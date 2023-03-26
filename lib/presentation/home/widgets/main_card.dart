import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.posterPath,
  });
  final String posterPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 120,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: kRadius10,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
               posterPath),
          ),
        ),
      ),
    );
  }
}
