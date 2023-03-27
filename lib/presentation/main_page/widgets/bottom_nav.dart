import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            backgroundColor: backgroundColor,
            selectedItemColor: kWhiteColor,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(
              color: kWhiteColor,
            ),
            unselectedIconTheme: const IconThemeData(
              color: Colors.grey,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_fire_department_outlined),
                  label: "New & Hot"),
              BottomNavigationBarItem(
                icon: Icon(Icons.sentiment_very_satisfied),
                label: "Fast Laugh",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download_rounded),
                label: "Downloads",
              ),
            ]);
      },
    );
  }
}
