import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/widgets.dart/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          title: "New & Hot",
        ),
        preferredSize: Size.fromHeight(50),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
