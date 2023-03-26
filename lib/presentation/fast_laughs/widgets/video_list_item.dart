import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:video_player/video_player.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

ValueNotifier<Set<int>> likedVideoIdsNotifier = ValueNotifier({});
class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {super.key, required this.widget, required this.movieData})
      : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)!.movieData.posterPath;
    final videoUrl = videoUrls[index % videoUrls.length];

    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          onStateChange: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //left side
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_off,
                  color: Colors.white,
                ),
              ),

              //right side

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CircleAvatar(
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage(
                              '$imageAppendUrl$posterPath',
                            ),
                    ),
                  ),
                 ValueListenableBuilder(
                      valueListenable: likedVideoIdsNotifier,
                      builder: (context, Set<int> newLikedListIds, Widget? _) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(UnlikedVideo(id: _index));
                              likedVideoIdsNotifier.value.remove(_index);
                              likedVideoIdsNotifier.notifyListeners();
                            },
                            child: VideoActionsWidget(
                              icon: Icons.favorite,
                              title: "Liked",
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<FastLaughBloc>(context)
                            //     .add(LikedVideo(id: _index));
                            likedVideoIdsNotifier.value.add(_index);
                            likedVideoIdsNotifier.notifyListeners();
                          },
                          child: VideoActionsWidget(
                            icon: Icons.emoji_emotions,
                            title: "LOL",
                          ),
                        );
                      },
                    ),
                  VideoActionsWidget(icon: Icons.add, title: "My List"),
                  VideoActionsWidget(icon: Icons.share, title: "Share"),
                  VideoActionsWidget(icon: Icons.play_arrow, title: "Play"),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  VideoActionsWidget({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(color: kWhiteColor, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChange;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChange});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
