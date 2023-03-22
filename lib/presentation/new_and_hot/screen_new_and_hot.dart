import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

import '../../core/constants.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: AppBar(
              backgroundColor: backgroundColor,
              title: const Text(
                "New & Hot",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                const Icon(
                  size: 30,
                  Icons.cast,
                  color: kWhiteColor,
                ),
                kWidth,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Container(
                    color: Colors.cyan,
                    width: 30,
                  ),
                ),
              ],
              bottom: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kWhiteColor,
                ),
                unselectedLabelColor: kWhiteColor,
                labelColor: kBlackColor,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "🍿Coming Soon",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "👀Everyone's Watching",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: backgroundColor,
        body: TabBarView(
          children: [
            _buildComingSoon(context),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }
}

Widget _buildComingSoon(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 420,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "FEB",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "11",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width - 50,
                  height: 420,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            "https://images8.alphacoders.com/116/1164638.jpg",
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 5,
                            bottom: 5,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.volume_off,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "LUCIFER",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications_outlined,
                                  size: 30,
                                  color: kWhiteColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.info_outline,
                                  size: 30,
                                  color: kWhiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Coming on February 11",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Lucifer Morningstar has decided he's had enough of being the dutiful servant in Hell and decides to spend some time on Earth to better understand humanity. He settles in Los Angeles - the City of Angels.",
                            textAlign: TextAlign.start,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          kHeight,
                          const Text(
                            "Drama · Mythical · Crime · Comedy",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          kHeight,
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      });
}

Widget _buildEveryonesWatching() {
  return const Text("Hello");
}
