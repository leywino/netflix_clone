import 'package:flutter/material.dart';

class SearchTitleWidget extends StatelessWidget {
  SearchTitleWidget({super.key, this.title});
  String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
