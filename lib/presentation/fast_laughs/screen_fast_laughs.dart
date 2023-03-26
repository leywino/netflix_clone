import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presentation/fast_laughs/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator();
            } else if (state.isError) {
              return const Center(
                child: Text("Error found"),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                    state.videosList.length,
                    (index) => VideoListItemInheritedWidget(
                        widget: VideoListItem(
                          index: index,
                          key: Key(
                            index.toString(),
                          ),
                        ),
                        movieData: state.videosList[index])),
              );
            }
          },
        ),
      ),
    );
  }
}
