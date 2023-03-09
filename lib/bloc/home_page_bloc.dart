import 'package:flutter/material.dart';

import '../data/apply/movie_apply.dart';
import '../data/apply/movie_apply_impl.dart';
import '../data/vos/actors_vo.dart';
import '../data/vos/genre_id_vo.dart';
import '../data/vos/movie_vo.dart';

class HomePageBloc extends ChangeNotifier {
  bool _isDispose = false;

  List<MovieVo> _getNowPlayingMovieList = [];
  List<MovieVo> _getPopularMovieList = [];
  List<ActorsVo> _actorsList = [];
  List<GenreIdVo> _genreList = [];
  List<MovieVo> _movieByGenreList = [];

  final MovieApply _movieApply = MovieApplyImpl();

  HomePageBloc(int page, int withGenre) {
    _movieApply.getNowPlayingMovieListFromDatabaseStream(page).listen((event) {
      _getNowPlayingMovieList = event ?? [];
      _getPopularMovieList = event ?? [];
      notifyListeners();
    });

    _movieApply.getActorsListFromDatabaseStream(page).listen((event) {
      _actorsList = event ?? [];
      notifyListeners();
    });

    _movieApply.getGenreIdListFromDatabaseStream().listen((event) {
      _genreList = event ?? [];
      notifyListeners();
    });

    _movieApply
        .getMovieByGenreListFromDatabaseStream(withGenre, page)
        .listen((event) {
      _movieByGenreList = event ?? [];
      notifyListeners();
    });
  }

  ///Getter
  bool get isDispose => _isDispose;
  List<MovieVo> get getNowPlayingMovieList => _getNowPlayingMovieList;
  List<MovieVo> get getPopularMovieList => _getPopularMovieList;
  List<ActorsVo> get getActorsList => _actorsList;
  List<GenreIdVo> get getGenreList => _genreList;
  List<MovieVo> get getMovieByGenreList => _movieByGenreList;

  void onTapGenre(int value, int withGenre, int page) {
    _movieApply
        .getMovieByGenreListFromDatabaseStream(withGenre, page)
        .listen((event) {
      List<MovieVo> temp = event ?? [];
      _movieByGenreList = temp;

      notifyListeners();
    });
  }

  @override
  void notifyListeners() {
    if (!_isDispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _isDispose = true;
  }
}
