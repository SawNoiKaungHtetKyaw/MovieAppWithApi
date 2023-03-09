import 'package:flutter/material.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/widgets/movie_list.dart';

import '../../../constants/demis.dart';
import '../../../data/apply/movie_apply.dart';
import '../../../data/apply/movie_apply_impl.dart';
import '../../../widgets/movie_title_and_more.dart';

class RelatedMovie extends StatefulWidget {
  const RelatedMovie(
      {super.key,
      required this.movie,
      required this.title,
      required this.movieId,
      required this.controller});
  final List<MovieVo> movie;
  final String title;
  final int movieId;
  final ScrollController controller;

  @override
  State<RelatedMovie> createState() => _RelatedMovieState();
}

class _RelatedMovieState extends State<RelatedMovie> {
  final MovieApply _movieApply = MovieApplyImpl();

  int page = 1;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() async {
      if (widget.controller.position.atEdge) {
        if (widget.controller.position.pixels != 0) {
          page++;
          await _movieApply.getSimilarMovie(page, widget.movieId).then((value) {
            setState(() {
              widget.movie.addAll(value ?? []);
            });
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieTitleAndMore(title: widget.title),
        const SizedBox(height: kSP10x),
        MovieList(controller: widget.controller, movie: widget.movie)
      ],
    );
  }
}
