import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/downloads/widgets/download_image_widget.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          const _SmartDownloads(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Row(
                  children: const [
                    kWidth,
                    Text(
                      "Indroducing Downloads for you",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "We will download a personalised selection of movies and shows for you, so there is always something to watch on your device",
                    // textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                BlocBuilder<DownloadsBloc, DownloadsState>(
                  builder: (context, state) {
                    return Container(
                      width: size.width,
                      height: size.width,
                      color: Colors.black,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: size.width * 0.37,
                              backgroundColor: Colors.grey[800],
                            ),
                          ),
                          DownloadImageRotate(
                            index: 0,
                            angle: -20,
                            edge: const EdgeInsets.only(right: 170, top: 60),
                            downloadHeight: 0.52,
                            downloadWidth: 0.33,
                            imageUrl: state.downloads.isNotEmpty
                                ? '$imageAppendUrl${state.downloads[2].posterPath}'
                                : "https://wallpapercave.com/dwp1x/wp11809973.png",
                          ),
                          DownloadImageRotate(
                            index: 1,
                            angle: 20,
                            edge: const EdgeInsets.only(left: 170, top: 60),
                            downloadHeight: 0.52,
                            downloadWidth: 0.33,
                            imageUrl: state.downloads.isNotEmpty
                                ? '$imageAppendUrl${state.downloads[1].posterPath}'
                                : "https://wallpapercave.com/dwp1x/wp11809973.png",
                          ),
                          DownloadImageRotate(
                            index: 2,
                            angle: 0,
                            edge: const EdgeInsets.only(left: 0),
                            downloadHeight: 0.63,
                            downloadWidth: 0.43,
                            imageUrl: state.downloads.isNotEmpty
                                ? '$imageAppendUrl${state.downloads[0].posterPath}'
                                : "https://wallpapercave.com/dwp1x/wp11809973.png",
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () {},
                      color: kButtonColorBlue,
                      child: const Text(
                        "Set up",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75),
            child: MaterialButton(
              onPressed: () {},
              color: kButtonColorWhite,
              child: const Text(
                "Find More to Download",
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          kWidth,
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5,
            children: const [
              Icon(
                Icons.settings,
                color: kWhiteColor,
              ),
              Text("Smart Downloads"),
            ],
          ),
        ],
      ),
    );
  }
}
