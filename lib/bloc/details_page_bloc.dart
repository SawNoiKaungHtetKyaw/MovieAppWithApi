import 'package:flutter/material.dart';

import '../data/apply/movie_apply.dart';
import '../data/apply/movie_apply_impl.dart';
import '../data/vos/cast_vo.dart';
import '../data/vos/crew_vo.dart';
import '../data/vos/movie_details_vo.dart';
import '../data/vos/movie_vo.dart';

class DetailsPageBloc extends ChangeNotifier {
  bool _dispose = false;
  MovieDetailsVo? _movieDetails;
  List<CastVo> _castList = [];
  List<CrewVo> _crewList = [];
  List<MovieVo> _similarMovieList = [];

  final MovieApply _movieApply = MovieApplyImpl();

  DetailsPageBloc(int id, int page) {
    _movieApply.getMovieDetailsFromDatabaseStream(id).listen((event) {
      _movieDetails = event;
      notifyListeners();
    });

    _movieApply.getCreditsResponeFromDatabaseStream(id).listen((event) {
      _castList = event?.cast ?? [];
      _crewList = event?.crew ?? [];
      notifyListeners();
    });

    _movieApply.getSimilarMovie(page, id).then((value) {
      _similarMovieList = value ?? [];
      notifyListeners();
    });
  }

  ////Getter
  bool get isDispose => _dispose;
  MovieDetailsVo? get getMovieDetails => _movieDetails;
  List<CastVo> get getCastList => _castList;
  List<CrewVo> get getCrewList => _crewList;
  List<MovieVo> get getSimilarMovieList => _similarMovieList;

  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
