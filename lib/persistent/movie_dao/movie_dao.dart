import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:movie_project/data/vos/cast_vo.dart';
import 'package:movie_project/data/vos/movie_details_vo.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/network/respone/credits_respone.dart';
import 'package:movie_project/network/respone/movie_by_genre_respone.dart';

import '../../data/vos/actors_vo.dart';
import '../../data/vos/genre_id_vo.dart';

abstract class MovieDAO {
  ////Now Playing
  void saveGetNowPlaying(List<MovieVo> movieList);
  List<MovieVo>? getNowPlayingMovieListFromDatabase();
  Stream watchNowPlayingBox();
  Stream<List<MovieVo>?> getNowPlayingMovieListFromDatabaseStream();

  /////Showcase
  void saveShowCase(List<MovieVo> movieList);
  List<MovieVo>? getShowCaseMovieListFromDatabase();
  Stream watchShowCaseBox();
  Stream<List<MovieVo>?> getShowCaseMovieListFromDatabaseStream();

  /////Actors
  void saveActors(List<ActorsVo> actorList);
  List<ActorsVo>? getActorsListFromDatabase();
  Stream watchActorsBox();
  Stream<List<ActorsVo>?> getActorsListFromDatabaseStream();

  //////Movie Details
  void saveDetails(MovieDetailsVo movieDetails);
  MovieDetailsVo? getMovieDetailsFromDatabase(int movieId);
  Stream watchMovieDetailsBox(int movieId);
  Stream<MovieDetailsVo?> getMovieDetailsFromDatabaseStream(int movieId);

  /////Credit
  void saveCredits(CreditsRespone credits);
  CreditsRespone? getCreditsResponeFromDatabase(int movieId);
  Stream watchCreditsBox(int movieId);
  Stream<CreditsRespone?> getCreditsResponeFromDatabaseStream(int movieId);

  /////Similar Movie
  void saveSimilarMovie(MovieByGenreRespone similarMovieList, int movieId);
  MovieByGenreRespone? getSimilarMovieListFromDatabase(int movieId);
  Stream watchSimilarMovieBox(int movieId);
  Stream<MovieByGenreRespone?> getSimilarMovieListFromDatabaseStream(
      int movieId);

  /////Genre Id
  void saveGenreId(List<GenreIdVo> genreIds);
  List<GenreIdVo>? getGenreIdListFromDatabase();
  Stream watchGenreIdBox();
  Stream<List<GenreIdVo>?> getGenreIdListFromDatabaseStream();

  //////Movie By Genre
  void saveMovieByGenre(List<MovieVo> movieByGenre);
  List<MovieVo>? getMovieByGenreListFromDatabase();
  Stream watchMovieByGenreBox();
  Stream<List<MovieVo>?> getMovieByGenreListFromDatabaseStream();

  /////order count
  void saveCount(int count);
  int? getCountValue();
}
