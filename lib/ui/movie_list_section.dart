import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:movieapp/provider/movie_list_pvd.dart';
import 'package:movieapp/styles/my_textstyle.dart';
import 'package:movieapp/utils/constants.dart';
import 'package:provider/provider.dart';

class MovieListSection extends StatelessWidget {
  const MovieListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final movieListPvd = context.watch<MovieListPvd>();
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: movieListPvd.movieList?.length,
      itemBuilder: (context, index) {
        final Map movieData = movieListPvd.movieList![index];
        log(movieData.toString());
        return Container(
          height: 220,
          width: double.infinity,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.white24),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                "${Constants.imgPath(movieData['poster_path'])}",
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error),
                      SizedBox(height: 10),
                      Text("Failed to load image")
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        movieData['title'],
                        style: MyTextStyles.movieTitle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        movieData['overview'],
                        style: MyTextStyles.movieSubtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
