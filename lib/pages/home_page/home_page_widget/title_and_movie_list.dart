import 'package:flutter/material.dart';
import 'package:movie_project/bloc/home_page_bloc.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/widgets/movie_list.dart';
import 'package:provider/provider.dart';

import '../../../constants/demis.dart';
import '../../../data/apply/movie_apply.dart';
import '../../../data/apply/movie_apply_impl.dart';
import '../../../widgets/movie_title_and_more.dart';

class BestPopularMovieAndSerialsItemView extends StatefulWidget {
  const BestPopularMovieAndSerialsItemView(
      {super.key,
      required this.movie,
      required this.title,
      required this.controller});
  final List<MovieVo> movie;
  final String title;
  final ScrollController controller;

  @override
  State<BestPopularMovieAndSerialsItemView> createState() =>
      _BestPopularMovieAndSerialsItemViewState();
}

class _BestPopularMovieAndSerialsItemViewState
    extends State<BestPopularMovieAndSerialsItemView> {
  final MovieApply _movieApply = MovieApplyImpl();

  int page = 1;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() async {
      if (widget.controller.position.atEdge) {
        if (widget.controller.position.pixels != 0) {
          page++;
          await _movieApply.getNowPlayingMoviesRespone(page);
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
    return ChangeNotifierProvider<HomePageBloc>(
      create: (_) => HomePageBloc(page, 0),
      child: Column(
        children: [
          MovieTitleAndMore(title: widget.title),
          const SizedBox(height: kSP10x),
          Selector<HomePageBloc, List<MovieVo>>(
              selector: (_, bloc) => bloc.getPopularMovieList,
              builder: (_, value, child) =>
                  MovieList(controller: widget.controller, movie: widget.movie))
        ],
      ),
    );
  }
}
