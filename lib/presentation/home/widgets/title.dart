import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainTitle extends StatelessWidget {
  MainTitle({super.key, this.title});
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
