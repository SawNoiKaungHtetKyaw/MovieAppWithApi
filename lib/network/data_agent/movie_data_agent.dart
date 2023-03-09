import 'package:movie_project/data/vos/actors_vo.dart';
import 'package:movie_project/data/vos/genre_id_vo.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/network/respone/credits_respone.dart';

import '../../data/vos/movie_details_vo.dart';
import '../respone/movie_by_genre_respone.dart';

abstract class MovieDataAgent {
  Future<List<MovieVo>?> getNowPlayingMoviesRespone(int page);
  Future<List<GenreIdVo>?> getGenreIdRespone();
  Future<List<MovieVo>?> getMovieByGenreRespone(int withGenre, int page);
  Future<List<MovieVo>?> getPopularMovieRespone(int page);
  Future<List<ActorsVo>?> getActorsRespone(int page);
  Future<MovieDetailsVo>? getMovieDetails(int movieId);
  Future<CreditsRespone>? getCreditsRespone(int movieId);
  Future<List<MovieVo>?> getSimilarMovie(int page, int movieId);
}
