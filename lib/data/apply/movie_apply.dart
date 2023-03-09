import 'package:movie_project/data/vos/actors_vo.dart';
import 'package:movie_project/data/vos/movie_details_vo.dart';
import 'package:movie_project/data/vos/movie_vo.dart';

import '../../network/respone/credits_respone.dart';
import '../../network/respone/movie_by_genre_respone.dart';
import '../vos/genre_id_vo.dart';

abstract class MovieApply {
  //Network
  Future<List<MovieVo>?> getNowPlayingMoviesRespone(int page);
  Future<List<GenreIdVo>?> getGenreIdRespone();
  Future<List<MovieVo>?> getMovieByGenreRespone(int withGenre, int page);
  Future<List<MovieVo>?> getPopularMovieRespone(int page);
  Future<List<ActorsVo>?> getActorsRespone(int page);
  Future<MovieDetailsVo>? getMovieDetails(int movieId);
  Future<CreditsRespone>? getCreditsRespone(int movieId);
  Future<List<MovieVo>?> getSimilarMovie(int page, int movieId);

  //Database
  //Now Playing
  void saveGetNowPlaying(List<MovieVo> movieList);
  List<MovieVo>? getNowPlayingMovieListFromDatabase();
  Stream<List<MovieVo>?> getNowPlayingMovieListFromDatabaseStream(int page);

  /////Showcase
  void saveShowCase(List<MovieVo> movieList);
  List<MovieVo>? getShowCaseMovieListFromDatabase();
  Stream<List<MovieVo>?> getShowCaseMovieListFromDatabaseStream(int page);

  /////Actors
  void saveActors(List<ActorsVo> actorList);
  List<ActorsVo>? getActorsListFromDatabase();
  Stream<List<ActorsVo>?> getActorsListFromDatabaseStream(int page);

  //////Movie Details
  void saveDetails(MovieDetailsVo movieDetails);
  MovieDetailsVo? getMovieDetailsFromDatabase(int movieId);
  Stream<MovieDetailsVo?> getMovieDetailsFromDatabaseStream(int movieId);

  /////Credits (Cast and Crew)
  void saveCredits(CreditsRespone credits);
  CreditsRespone? getCreditsResponeFromDatabase(int movieId);
  Stream<CreditsRespone?> getCreditsResponeFromDatabaseStream(int movieId);

  /////Similar Movie
  void saveSimilarMovie(MovieByGenreRespone  similarMovieList,int movieId);
  MovieByGenreRespone? getSimilarMovieListFromDatabase(int movieId);
  Stream<MovieByGenreRespone?> getSimilarMovieListFromDatabaseStream(
      int page, int movieId);

  /////Genre Id
  void saveGenreId(List<GenreIdVo> genreIds);
  List<GenreIdVo>? getGenreIdListFromDatabase();
  Stream<List<GenreIdVo>?> getGenreIdListFromDatabaseStream();    

  //////Movie By Genre
  void saveMovieByGenre(List<MovieVo> movieByGenre);
  List<MovieVo>? getMovieByGenreListFromDatabase();
  Stream<List<MovieVo>?> getMovieByGenreListFromDatabaseStream(
      int withGenre,int page);
}
