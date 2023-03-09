import 'package:dio/dio.dart';
import 'package:movie_project/constants/api_constants.dart';
import 'package:movie_project/data/vos/actors_vo.dart';
import 'package:movie_project/data/vos/genre_id_vo.dart';
import 'package:movie_project/data/vos/movie_details_vo.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/network/api/movies_api.dart';
import 'package:movie_project/network/data_agent/movie_data_agent.dart';
import 'package:movie_project/network/respone/credits_respone.dart';


class MovieDataAgentImpl extends MovieDataAgent {
  late MoviesApi _api;

  MovieDataAgentImpl._() {
    _api = MoviesApi(Dio());
  }

  static final MovieDataAgentImpl _singleton = MovieDataAgentImpl._();

  factory MovieDataAgentImpl() => _singleton;

  @override
  Future<List<MovieVo>?> getNowPlayingMoviesRespone(int page) => _api
      .getNowPlayingMoviesRespone(kApiToken, page) //Future<MovieRespone>
      .asStream() //Stream<MovieRespone>
      .map((event) => event.results) //Stream<List<MovieVo>?>
      .first; //Future<List<MovieVo>?>

  @override
  Future<List<GenreIdVo>?> getGenreIdRespone() =>
      _api.getGenreIdRespone(kApiToken).then((value) => value.genres);

  @override
  Future<List<MovieVo>?> getMovieByGenreRespone(int withGenre, int page) =>
      _api.getMovieByGenreRespone(withGenre, kApiToken, page).then((value) {
        return value.results;
      });

  @override
  Future<List<MovieVo>?> getPopularMovieRespone(int page) => _api
      .getPopularMovieRespone(kApiToken, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<ActorsVo>?> getActorsRespone(int page) => _api
      .getActorsRespone(kApiToken, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<MovieDetailsVo>? getMovieDetails(int movieId) =>
      _api.getMovieDetailsRespone(kApiToken, movieId);

  @override
  Future<List<MovieVo>?> getSimilarMovie(int page, int movieId) => _api
      .getSimilarMovieRespone(kApiToken, page, movieId)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<CreditsRespone>? getCreditsRespone(int movieId) =>
      _api.getCreditsRespone(kApiToken, movieId);
}
