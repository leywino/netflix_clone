import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home_page/home_page_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/main_title_card.dart';

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  // ignore: non_constant_identifier_names
  ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomePageBloc>(context).add(const GetHomeScreenData());
    });
    return ValueListenableBuilder(
        valueListenable: ScrollNotifier,
        builder: ((context, scrollBool, _) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  ScrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  ScrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  BlocBuilder<HomePageBloc, HomePageState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        );
                      } else if (state.hasError) {
                        return const Center(
                          child: Text(
                            "Error while getting data",
                            style: TextStyle(color: kWhiteColor),
                          ),
                        );
                      }

                      final releasedPastYear = state.pastYearMovieList.map(
                        (m) {
                          return '$imageAppendUrl${m.posterPath}';
                        },
                      ).toList();
                      releasedPastYear.shuffle();
                      //trending--------

                      final trending = state.trendingMovieList.map(
                        (m) {
                          return '$imageAppendUrl${m.posterPath}';
                        },
                      ).toList();
                      trending.shuffle();
                      //tense drama---------
                      final tenseDrama = state.tenseMovieList.map(
                        (m) {
                          return '$imageAppendUrl${m.posterPath}';
                        },
                      ).toList();
                      //south indian Cinemas---------

                      final southIndianCinemas =
                          state.southIndianMovieList.map(
                        (m) {
                          return '$imageAppendUrl${m.posterPath}';
                        },
                      ).toList();
                      southIndianCinemas.shuffle();

                      // top 10 tv show--------

                      final top10TvShow = state.trendingTvList.map(
                        (m) {
                          return '$imageAppendUrl${m.posterPath}';
                        },
                      ).toList();
                      top10TvShow.shuffle();
                      return ListView(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 500,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(kMainImage),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _HomeButtons("My List", Icons.add),
                                    _PlayButton(),
                                    _HomeButtons("Info", Icons.info),
                                  ],
                                ),
                              )
                            ],
                          ),
                          MainTitleCard(
                            title: "Released in the Past Year",
                            posterList: releasedPastYear,
                          ),
                          MainTitleCard(
                            title: "Trending Now",
                            posterList: trending,
                          ),
                          // MainTitleCard2(
                          //   title: "Top 10 TV shows in India today",
                          //   posterList: _top10TvShow,
                          // ),
                          MainTitleCard(
                            title: "Tense Dramas",
                            posterList: tenseDrama,
                          ),
                          MainTitleCard(
                            title: "South Indian Cinemas",
                            posterList: southIndianCinemas,
                          ),
                        ],
                      );
                    },
                  ),
                  Visibility(
                    visible: scrollBool,
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 2000,
                      ),
                      color: Colors.black.withOpacity(0.5),
                      width: double.infinity,
                      height: 90,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.network(
                                  "https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png",
                                  width: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  size: 30,
                                  Icons.cast,
                                  color: kWhiteColor,
                                ),
                                kWidth,
                                Container(
                                  color: Colors.cyan,
                                  width: 25,
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                "TV Shows",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Movies",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Categories",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  // ignore: non_constant_identifier_names
  Wrap _HomeButtons(String title, IconData icon) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      direction: Axis.vertical,
      children: [
        Icon(
          icon,
          color: Colors.white,
          weight: 30,
          size: 25,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  TextButton _PlayButton() {
    return TextButton.icon(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          "Play",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
