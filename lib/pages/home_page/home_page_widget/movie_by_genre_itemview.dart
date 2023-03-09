import 'package:flutter/material.dart';
import 'package:movie_project/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/demis.dart';
import '../../../data/apply/movie_apply.dart';
import '../../../data/apply/movie_apply_impl.dart';
import '../../../data/vos/movie_vo.dart';
import '../../../widgets/movie_list.dart';

class MovieByGenreItemView extends StatefulWidget {
  const MovieByGenreItemView({super.key});

  @override
  State<MovieByGenreItemView> createState() => _MovieByGenreItemViewState();
}

class _MovieByGenreItemViewState extends State<MovieByGenreItemView> {
  //Controller
  final ScrollController _controller = ScrollController();

  //Instance object
  final MovieApply movieApply = MovieApplyImpl();

  //Variable
  int withGenre = 28;
  int page = 1;

  List<MovieVo> tempList = [];

  @override
  void initState() {
    super.initState();

    ////ScrollContrlller
    _controller.addListener(() async {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels != 0) {
          page++;
          movieApply.getMovieByGenreRespone(withGenre, page);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
      create: (_) => HomePageBloc(page, withGenre),
      child: Consumer<HomePageBloc>(builder: (_, bloc, child) {
        if (bloc.getMovieByGenreList.isNotEmpty) {
          tempList = [];
          bloc.getMovieByGenreList.forEach((movie) {
            if (movie.genreIDs != null) {
              if (movie.genreIDs!.contains(withGenre)) {
                tempList.add(movie);
              }
            }
          });
        }
        return Column(
          children: [
            DefaultTabController(
                length: bloc.getGenreList.length,
                initialIndex: 0,
                child: TabBar(
                    onTap: (value) {
                      withGenre = bloc.getGenreList[value].id ?? 28;

                      ///When click on TabBar, Show Movie by genre
                      bloc.onTapGenre(value, withGenre, page);

                      if (_controller.positions.isNotEmpty) {
                        _controller.animateTo(
                            _controller.position.minScrollExtent,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      }
                    },
                    padding: const EdgeInsets.only(left: kSP10x),
                    isScrollable: true,
                    indicatorColor: kPlayButtonColor,
                    unselectedLabelColor: kWhite.withOpacity(0.3),
                    tabs: bloc.getGenreList
                        .map((genre) => Tab(
                              text: genre.name,
                            ))
                        .toList())),
            Container(
                width: double.infinity,
                height: kMovieByGenreHeight,
                color: kPrimaryColor,
                alignment: Alignment.center,
                child: (tempList.isNotEmpty)
                    ? MovieList(controller: _controller, movie: tempList)
                    : const Center(
                        child: CircularProgressIndicator(),
                      )),
          ],
        );
      }),
    );
  }
}
