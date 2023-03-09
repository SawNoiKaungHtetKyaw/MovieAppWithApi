import 'package:hive/hive.dart';
import 'package:movie_project/constants/hive_constants.dart';
import 'package:movie_project/data/vos/actors_vo.dart';
import 'package:movie_project/data/vos/genre_id_vo.dart';
import 'package:movie_project/data/vos/movie_details_vo.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/network/respone/credits_respone.dart';

import '../../network/respone/movie_by_genre_respone.dart';
import 'movie_dao.dart';

class MovieDAOImpl extends MovieDAO {
  MovieDAOImpl._();

  static final MovieDAOImpl _singleton = MovieDAOImpl._();

  factory MovieDAOImpl() => _singleton;

  /////////////////Now Playing Movie List

  ////Create box
  Box<MovieVo> _getNowPlayingMovieVoBox() => Hive.box<MovieVo>(kHiveMovieBox);

  /////save

  @override
  void saveGetNowPlaying(List<MovieVo> movieList) {
    int count = getCountValue() ?? 0;
    movieList.forEach((movie) {
      count++;
      movie.order = count;
      _getNowPlayingMovieVoBox().put(movie.id, movie);
    });
    saveCount(count);
  }

  /////get
  @override
  List<MovieVo>? getNowPlayingMovieListFromDatabase() {
    List<MovieVo> temp = _getNowPlayingMovieVoBox().values.toList();

    temp.sort((a, b) {
      int value1 = a.order ?? 0;
      int value2 = b.order ?? 0;
      return value1 > value2 ? 1 : -1;
    });

    return temp;
  }

  /////watch
  @override
  Stream watchNowPlayingBox() => _getNowPlayingMovieVoBox().watch();

  ////to Stream
  @override
  Stream<List<MovieVo>?> getNowPlayingMovieListFromDatabaseStream() =>
      Stream.value(getNowPlayingMovieListFromDatabase());

  //=======================================================================================

  ///////////Show Case Movie List

  ////Create Box
  Box<MovieVo> _getShowcaseMovieVoBox() => Hive.box<MovieVo>(kHiveShowcaseBox);

  /////get
  @override
  List<MovieVo>? getShowCaseMovieListFromDatabase() {
    List<MovieVo> temp = _getShowcaseMovieVoBox().values.toList();

    temp.sort((a, b) {
      int value1 = a.order ?? 0;
      int value2 = b.order ?? 0;
      return value1 > value2 ? 1 : -1;
    });
    return temp;
  }

  /////save
  @override
  void saveShowCase(List<MovieVo> movieList) {
    int count = getCountValue() ?? 0;
    movieList.forEach((movie) {
      count++;
      movie.order = count;
      _getShowcaseMovieVoBox().put(movie.id, movie);
    });
    saveCount(count);
  }

  /////watch
  @override
  Stream watchShowCaseBox() => _getShowcaseMovieVoBox().watch();

  ////To Stream
  @override
  Stream<List<MovieVo>?> getShowCaseMovieListFromDatabaseStream() =>
      Stream.value(getShowCaseMovieListFromDatabase());

  //=======================================================================================

  ///////////Actors List

  ////Create Box
  Box<ActorsVo> _getActorsVoBox() => Hive.box<ActorsVo>(kHiveActorsBox);

  /////Save
  @override
  void saveActors(List<ActorsVo> actorList) {
    int count = getCountValue() ?? 0;
    actorList.forEach((actor) {
      count++;
      actor.order = count;
      _getActorsVoBox().put(actor.id, actor);
    });
    saveCount(count);
  }

  ////get
  @override
  List<ActorsVo>? getActorsListFromDatabase() {
    List<ActorsVo> temp = _getActorsVoBox().values.toList();
    temp.sort((a, b) {
      int value1 = a.order ?? 0;
      int value2 = a.order ?? 0;
      return value1 > value2 ? 1 : -1;
    });
    return temp;
  }

  /////watch
  @override
  Stream watchActorsBox() => _getActorsVoBox().watch();

  /////To Stream
  @override
  Stream<List<ActorsVo>?> getActorsListFromDatabaseStream() =>
      Stream.value(getActorsListFromDatabase());

  //=======================================================================================

  ///////////Movie Details

  ////Create Box
  Box<MovieDetailsVo> _getMovieDetailsVoBox() =>
      Hive.box<MovieDetailsVo>(kHiveMovieDetailsBox);

  ////Get
  @override
  MovieDetailsVo? getMovieDetailsFromDatabase(int movieId) =>
      _getMovieDetailsVoBox().get(movieId);

  ////watch
  @override
  Stream watchMovieDetailsBox(int movieId) =>
      _getMovieDetailsVoBox().watch(key: movieId);

  ////To Stream
  @override
  Stream<MovieDetailsVo?> getMovieDetailsFromDatabaseStream(int movieId) =>
      Stream.value(getMovieDetailsFromDatabase(movieId));

////save
  @override
  void saveDetails(MovieDetailsVo movieDetails) =>
      _getMovieDetailsVoBox().put(movieDetails.id, movieDetails);

  //=======================================================================================

  ///////////Similar Movie

  ////Create Box
  Box<MovieByGenreRespone> _getSimilarMovieBox() =>
      Hive.box<MovieByGenreRespone>(kHiveSimilarMovieBox);

  /////get
  @override
  MovieByGenreRespone? getSimilarMovieListFromDatabase(int movieId) =>
      _getSimilarMovieBox().get(movieId);

  /////To Stream
  @override
  Stream<MovieByGenreRespone?> getSimilarMovieListFromDatabaseStream(
          int movieId) =>
      Stream.value(getSimilarMovieListFromDatabase(movieId));

  //////save
  @override
  void saveSimilarMovie(MovieByGenreRespone similarMovieList, int movieId) =>
      _getSimilarMovieBox().put(movieId, similarMovieList);

  /////watch
  @override
  Stream watchSimilarMovieBox(int movieId) =>
      _getSimilarMovieBox().watch(key: movieId);

  //=======================================================================================

  ///////////Credits(Cast and Crew)

  ////Create Box
  Box<CreditsRespone> _getCreditBox() =>
      Hive.box<CreditsRespone>(kHiveCreditResponeBox);

  @override
  CreditsRespone? getCreditsResponeFromDatabase(int movieId) =>
      _getCreditBox().get(movieId);

  @override
  Stream<CreditsRespone?> getCreditsResponeFromDatabaseStream(int movieId) =>
      Stream.value(getCreditsResponeFromDatabase(movieId));

  @override
  void saveCredits(CreditsRespone credits) =>
      _getCreditBox().put(credits.id, credits);

  @override
  Stream watchCreditsBox(int movieId) => _getCreditBox().watch(key: movieId);

  //=======================================================================================

  ///////////Genre Id

  ////Create Box
  Box<GenreIdVo> _getGenreIdBox() => Hive.box<GenreIdVo>(kHiveGenreIdBox);

  @override
  List<GenreIdVo>? getGenreIdListFromDatabase() {
    List<GenreIdVo> temp = _getGenreIdBox().values.toList();
    temp.sort((a, b) {
      int value1 = a.order ?? 0;
      int value2 = b.order ?? 0;
      return value1 > value2 ? 1 : -1;
    });
    return temp;
  }

  @override
  Stream<List<GenreIdVo>?> getGenreIdListFromDatabaseStream() =>
      Stream.value(getGenreIdListFromDatabase());

  @override
  void saveGenreId(List<GenreIdVo> genreIds) {
    int count = getCountValue() ?? 0;
    genreIds.forEach((genre) {
      count++;
      genre.order = count;
      _getGenreIdBox().put(genre.id, genre);
    });
    saveCount(count);
  }

  @override
  Stream watchGenreIdBox() => _getGenreIdBox().watch();

  //=======================================================================================

  ///////////Movie by Genre

  ////Create Box
  Box<MovieVo> _getMovieByGenreBox() => Hive.box<MovieVo>(kHiveMovieByGenreBox);

  @override
  List<MovieVo>? getMovieByGenreListFromDatabase() {
    List<MovieVo> temp = _getMovieByGenreBox().values.toList();

    temp.sort((a, b) {
      int value1 = a.order ?? 0;
      int value2 = b.order ?? 0;
      return value1 > value2 ? 1 : -1;
    });
    return temp;
  }

  @override
  Stream<List<MovieVo>?> getMovieByGenreListFromDatabaseStream() =>
      Stream.value(getMovieByGenreListFromDatabase());

  @override
  void saveMovieByGenre(List<MovieVo> movieByGenre) {
    int count = getCountValue() ?? 0;
    movieByGenre.forEach((element) {
      count++;
      element.order = count;
      _getMovieByGenreBox().put(element.id, element);
    });
  }

  @override
  Stream watchMovieByGenreBox() => _getMovieByGenreBox().watch();

  //=======================================================================================

  ////Order Counter
  //Create box

  Box<int> _getCountBox() => Hive.box(kHiveCountBox);

  @override
  int? getCountValue() => _getCountBox().get(kHiveCountKey);

  @override
  void saveCount(int count) => _getCountBox().put(kHiveCountKey, count);

  //=======================================================================================
}
