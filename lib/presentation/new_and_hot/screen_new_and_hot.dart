import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/colors.dart';

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
        body: const TabBarView(
          children: [
            ComingSoonWidget(),
            EveryonesWatchingWidget(),
          ],
        ),
      ),
    );
  }
}

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator();
        } else if (state.hasError) {
          return const Center(
            child: Text("Error while loading coming soon list"),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text("Coming soon list is empty"),
          );
        } else {
          return ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                // print(state.comingSoonList[0].releaseDate);

                final date =
                    DateTime.parse(state.comingSoonList[index].releaseDate!);
                final formatedDate = DateFormat.yMMMMd('en_US').format(date);
                final month =
                    formatedDate.split(' ').first.substring(0, 3).toUpperCase();
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 420,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                month,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                state.comingSoonList[index].releaseDate!
                                    .split('-')[2],
                                style: const TextStyle(
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
                                  SizedBox(
                                    height: 250,
                                    child: Image.network(
                                      '$imageAppendUrl${state.comingSoonList[index].backdropPath!}',
                                      fit: BoxFit.cover,
                                    ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 300,
                                    child: Text(
                                      state
                                          .comingSoonList[index].originalTitle!,
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
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
                                  Text(
                                    state.comingSoonList[index].overview!,
                                    textAlign: TextAlign.start,
                                    // overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  kHeight,
                                  // const Text(
                                  //   "Drama · Mythical · Crime · Comedy",
                                  //   textAlign: TextAlign.start,
                                  //   style: TextStyle(
                                  //     fontSize: 16,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                  // kHeight,
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
      },
    );
  }
}

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryOneWatching());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator();
        } else if (state.hasError) {
          return const Center(
            child: Text("Error while loading coming soon list"),
          );
        } else if (state.everyOneIsWatchingList.isEmpty) {
          return const Center(
            child: Text("Coming soon list is empty"),
          );
        } else {
          return ListView.builder(
            itemCount: state.everyOneIsWatchingList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        state.everyOneIsWatchingList[index].backdropPath != null
                            ? '$imageAppendUrl${state.everyOneIsWatchingList[index].backdropPath}'
                            : "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg",
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 250,
                          child: Text(
                            state.everyOneIsWatchingList[index].title ??
                                state.everyOneIsWatchingList[index].name ??
                                'no title',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: kWhiteColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: kWhiteColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.play_arrow,
                                color: kWhiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.everyOneIsWatchingList[index].overview!,
                      textAlign: TextAlign.start,
                      // overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  kHeight,
                ],
              );
            },
          );
        }
      },
    );
  }
}
