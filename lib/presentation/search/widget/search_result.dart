import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/presentation/search/widget/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SearchTitleWidget(
                  title: "Movies & TV",
                ),
              ],
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3 / 4,
                  children: List.generate(15, (index) {
                    if (state.searchResultList.isEmpty) {
                      return const Center(
                        child: Text("No results found"),
                      );
                    } else {
                      final movie = state.searchResultList[index];
                      return MainCard(
                        imageUrl: movie.posterImageUrl,
                      );
                    }
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: NetworkImage(imageUrl ==
                      "https://image.tmdb.org/t/p/w500/null"
                  ? "https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg"
                  : imageUrl),
              fit: BoxFit.cover)),
    );
  }
}
