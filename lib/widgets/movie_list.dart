import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/pages/movie_details_page/movie_details.dart';
import 'package:movie_project/utils/extension.dart';

import '../constants/colors.dart';
import '../constants/demis.dart';
import '../constants/strings.dart';
import 'easy_text.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.controller, required this.movie});
  final ScrollController controller;
  final List<MovieVo> movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kMovieListHeight,
      width: double.maxFinite,
      child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: movie.length,
          itemBuilder: (context, index) {
            var image = movie[index].posterPath;
            var imageBackDropPath = movie[index].backdropPath;
            String imageUrl = image?.getImage() ?? '';
            // String imageBackDropPathUrl = imageBackDropPath?.getImage() ?? '';
            var rate = movie[index].voteAverage;
            var starRate = (rate ?? 0) / 2;

            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MovieDetails(id: movie[index].id ?? 0),
              )),
              child: Container(
                margin: const EdgeInsets.only(left: kSP10x),
                width: kMovieCardWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //List View Movie Poster Image
                    SizedBox(
                      width: kMoviePosterWidth,
                      height: kMoviePosterHeight,
                      child: Image.network(
                        (image != null) ? imageUrl : kNullImage,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: kSP10x),

                    //List View Movie Title
                    EasyText(
                      text: movie[index].title ?? '',
                      fontWeight: FontWeight.bold,
                    ),

                    const SizedBox(height: kSP5x),

                    //List View Movie Rating
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          rate.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        const SizedBox(
                          width: kSP10x,
                        ),
                        RatingBar.builder(
                          itemSize: kRatingSize16x,
                          initialRating: double.parse(starRate.toString()),
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: kPlayButtonColor,
                          ),
                          onRatingUpdate: (rating) {},
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
