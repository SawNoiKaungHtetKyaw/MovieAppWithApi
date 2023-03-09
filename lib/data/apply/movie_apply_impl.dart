import 'package:movie_project/data/apply/movie_apply.dart';
import 'package:movie_project/data/vos/actors_vo.dart';
import 'package:movie_project/data/vos/genre_id_vo.dart';
import 'package:movie_project/data/vos/movie_details_vo.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/network/data_agent/movie_data_agent.dart';
import 'package:movie_project/network/data_agent/movie_data_agent_impl.dart';
import 'package:movie_project/network/respone/credits_respone.dart';
import 'package:movie_project/persistent/movie_dao/movie_dao.dart';
import 'package:movie_project/persistent/movie_dao/movie_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../network/respone/movie_by_genre_respone.dart';

class MovieApplyImpl extends MovieApply {
  final MovieDataAgent dataAgent =
      MovieDataAgentImpl(); //connect with dataAgent

  final MovieDAO _movieDAO = MovieDAOImpl();

  MovieApplyImpl._();

  static final MovieApplyImpl _singleton = MovieApplyImpl._();

  factory MovieApplyImpl() => _singleton;

  //-------------------->Network Layer<-----------------------

  /////////Now Playing Network Call
  @override
  Future<List<MovieVo>?> getNowPlayingMoviesRespone(int page) =>
      dataAgent.getNowPlayingMoviesRespone(page).then((value) {
        List<MovieVo>? temp = value;
        temp = temp?.map((e) {
          e.isGetNowPlaying = true;
          return e;
        }).toList();
        _movieDAO.saveGetNowPlaying(temp ?? []);
        return temp;
      });

  //////GenreId Network Call
  @override
  Future<List<GenreIdVo>?> getGenreIdRespone() =>
      dataAgent.getGenreIdRespone().then((value) {
        saveGenreId(value ?? []);
        return value;
      });

  //////MovieByGenre Network Call
  @override
  Future<List<MovieVo>?> getMovieByGenreRespone(int withGenre, int page) =>
      dataAgent.getMovieByGenreRespone(withGenre, page).then((value) {
        var temp = value;
        temp = temp?.map((e) {
          e.isgetMovieByGenre = true;
          return e;
        }).toList();
        saveMovieByGenre(temp ?? []);
        return temp;
      });

  //////Popular Movie Network Call(showcase)
  @override
  Future<List<MovieVo>?> getPopularMovieRespone(int page) =>
      dataAgent.getPopularMovieRespone(page).then((value) {
        List<MovieVo>? temp = value;
        temp = temp?.map((e) {
          e.isPopularMovies = true;
          return e;
        }).toList();
        _movieDAO.saveShowCase(temp ?? []);
        return temp;
      });

  ///////Actors Network call
  @override
  Future<List<ActorsVo>?> getActorsRespone(int page) =>
      dataAgent.getActorsRespone(page).then((value) {
        _movieDAO.saveActors(value ?? []);
        return value;
      });

  //////Movie Details Network Call
  @override
  Future<MovieDetailsVo>? getMovieDetails(int movieId) =>
      dataAgent.getMovieDetails(movieId)?.then((value) {
        saveDetails(value);
        return value;
      });

  //////Credit(Cast and Crew)
  @override
  Future<CreditsRespone>? getCreditsRespone(int movieId) =>
      dataAgent.getCreditsRespone(movieId)?.then((value) {
        saveCredits(value);
        return value;
      });

  //////Similar Movie Network call
  @override
  Future<List<MovieVo>?> getSimilarMovie(int page, int movieId) =>
      dataAgent.getSimilarMovie(page, movieId).then((value) {
        var temp = value;
        temp = temp?.map((e) {
          e.isSimilarMovie = true;
          return e;
        }).toList();
        return temp;
      });

  //-------------------------------------->Database Layer<------------------------------------------

  //========>Now Playing
  /////Get Now Playing Movie List From Database
  @override
  List<MovieVo>? getNowPlayingMovieListFromDatabase() =>
      _movieDAO.getNowPlayingMovieListFromDatabase();

  //////Save Now Playing Movie List
  @override
  void saveGetNowPlaying(List<MovieVo> movieList) =>
      _movieDAO.saveGetNowPlaying(movieList);

  //////Stream Now Playing(Main call in Ui)
  @override
  Stream<List<MovieVo>?> getNowPlayingMovieListFromDatabaseStream(int page) {
    getNowPlayingMoviesRespone(page);
    return _movieDAO
        .watchNowPlayingBox()
        .startWith(_movieDAO.getNowPlayingMovieListFromDatabaseStream())
        .map((event) => _movieDAO.getNowPlayingMovieListFromDatabase());
  }

  ///===================================================================>

  //=======>Show Case
  //////Get Show Case Movie List From Database
  @override
  List<MovieVo>? getShowCaseMovieListFromDatabase() =>
      _movieDAO.getShowCaseMovieListFromDatabase();

  //////Save Now Playing Movie List
  @override
  void saveShowCase(List<MovieVo> movieList) =>
      _movieDAO.saveShowCase(movieList);

  //////Stream Now Playing(Main call in Ui)
  @override
  Stream<List<MovieVo>?> getShowCaseMovieListFromDatabaseStream(int page) {
    getPopularMovieRespone(page);
    return _movieDAO
        .watchShowCaseBox()
        .startWith(_movieDAO.getShowCaseMovieListFromDatabaseStream())
        .map((event) => _movieDAO.getShowCaseMovieListFromDatabase());
  }

  ///===================================================================>

  //=======>Show Case
  //////Get Show Case Movie List From Database
  @override
  List<ActorsVo>? getActorsListFromDatabase() =>
      _movieDAO.getActorsListFromDatabase();

  @override
  Stream<List<ActorsVo>?> getActorsListFromDatabaseStream(int page) {
    getActorsRespone(page);
    return _movieDAO
        .watchActorsBox()
        .startWith(_movieDAO.getActorsListFromDatabaseStream())
        .map((event) => getActorsListFromDatabase());
  }

  @override
  void saveActors(List<ActorsVo> actorList) => _movieDAO.saveActors(actorList);

  ///===================================================================>

  //=======>Show Case
  //////Get Movie Details From Database

  @override
  MovieDetailsVo? getMovieDetailsFromDatabase(int movieId) =>
      _movieDAO.getMovieDetailsFromDatabase(movieId);

  @override
  Stream<MovieDetailsVo?> getMovieDetailsFromDatabaseStream(int movieId) {
    getMovieDetails(movieId);
    return _movieDAO
        .watchMovieDetailsBox(movieId)
        .startWith(_movieDAO.getMovieDetailsFromDatabaseStream(movieId))
        .map((event) => getMovieDetailsFromDatabase(movieId));
  }

  @override
  void saveDetails(MovieDetailsVo movieDetails) =>
      _movieDAO.saveDetails(movieDetails);

  ///===================================================================>

  //=======>Credit(Cast and crew)
  //////Get Credit(Cast and crew) From Database

  @override
  CreditsRespone? getCreditsResponeFromDatabase(int movieId) =>
      _movieDAO.getCreditsResponeFromDatabase(movieId);

  @override
  Stream<CreditsRespone?> getCreditsResponeFromDatabaseStream(int movieId) {
    getCreditsRespone(movieId);
    return _movieDAO
        .watchCreditsBox(movieId)
        .startWith(_movieDAO.getCreditsResponeFromDatabaseStream(movieId))
        .map((event) => getCreditsResponeFromDatabase(movieId));
  }

  @override
  void saveCredits(CreditsRespone credits) => _movieDAO.saveCredits(credits);

  ///===================================================================>

  //=======>Similar Movie
  //////Get Similar Movie List From Database

  @override
  MovieByGenreRespone? getSimilarMovieListFromDatabase(int movieId) =>
      _movieDAO.getSimilarMovieListFromDatabase(movieId);

  @override
  Stream<MovieByGenreRespone?> getSimilarMovieListFromDatabaseStream(
      int page, int movieId) {
    getSimilarMovie(page, movieId);
    return _movieDAO
        .watchSimilarMovieBox(movieId)
        .startWith(_movieDAO.getSimilarMovieListFromDatabaseStream(movieId))
        .map((event) => getSimilarMovieListFromDatabase(movieId));
  }

  @override
  void saveSimilarMovie(MovieByGenreRespone similarMovieList, int movieId) =>
      _movieDAO.saveSimilarMovie(similarMovieList, movieId);

  ///===================================================================>

  //=======>Genre Id
  //////Get Genre Id List From Database
  @override
  List<GenreIdVo>? getGenreIdListFromDatabase() =>
      _movieDAO.getGenreIdListFromDatabase();

  @override
  Stream<List<GenreIdVo>?> getGenreIdListFromDatabaseStream() {
    getGenreIdRespone();
    return _movieDAO
        .watchGenreIdBox()
        .startWith(_movieDAO.getGenreIdListFromDatabaseStream())
        .map((event) => getGenreIdListFromDatabase());
  }

  @override
  void saveGenreId(List<GenreIdVo> genreIds) => _movieDAO.saveGenreId(genreIds);

  ///===================================================================>

  //=======>Movie by Genre
  //////Get Movie by Genre List From Database

  @override
  List<MovieVo>? getMovieByGenreListFromDatabase() =>
      _movieDAO.getMovieByGenreListFromDatabase();

  @override
  Stream<List<MovieVo>?> getMovieByGenreListFromDatabaseStream(
      int withGenre, int page) {
    getMovieByGenreRespone(withGenre, page);
    return _movieDAO
        .watchMovieByGenreBox()
        .startWith(_movieDAO.getMovieByGenreListFromDatabaseStream())
        .map((event) => getMovieByGenreListFromDatabase());
  }

  @override
  void saveMovieByGenre(List<MovieVo> movieByGenre) =>
      _movieDAO.saveMovieByGenre(movieByGenre);
}
