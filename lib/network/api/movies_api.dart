import 'package:dio/dio.dart';
import 'package:movie_project/constants/api_constants.dart';
import 'package:movie_project/network/respone/actors_respone.dart';
import 'package:movie_project/network/respone/credits_respone.dart';
import 'package:movie_project/network/respone/genre_id_respone.dart';
import 'package:movie_project/network/respone/movie_by_genre_respone.dart';
import 'package:movie_project/network/respone/movie_respone.dart';
import 'package:retrofit/http.dart';

import '../../data/vos/movie_details_vo.dart';

part 'movies_api.g.dart';

@RestApi(baseUrl: kBASE_URL)
abstract class MoviesApi {
  factory MoviesApi(Dio dio) => _MoviesApi(dio);

  @GET(kGetGenreIdEndPoint)
  Future<GenreIdRespone> getGenreIdRespone(
    @Query(kApiKey) String apiKey,
  );

  @GET(kGetNowPlayingEndPoint)
  Future<MovieRespone> getNowPlayingMoviesRespone(
    @Query(kApiKey) String apiKey,
    @Query(kPageKey) int page,
  );

  @GET(kGetGenreByMovieEndPoint)
  Future<MovieByGenreRespone> getMovieByGenreRespone(
      @Query(kWithGenres) int withGenres,
      @Query(kApiKey) String apiKey,
      @Query(kPageKey) int page);

  @GET(kGetPopularMovieEndPoint)
  Future<MovieRespone> getPopularMovieRespone(
      @Query(kApiKey) String apiKey, @Query(kPageKey) int page);

  @GET(kGetActorsEndPoint)
  Future<ActorsRespone> getActorsRespone(
      @Query(kApiKey) String apiKey, @Query(kPageKey) int page);

  @GET(kGetDetailsEndPoint)
  Future<MovieDetailsVo> getMovieDetailsRespone(
      @Query(kApiKey) String apiKey, @Path(kPathParameter) int movieId);

  @GET(kGetCreditsEndPoint)
  Future<CreditsRespone> getCreditsRespone(
      @Query(kApiKey) String apiKey, @Path(kPathParameter) int movieId);

  @GET(kGetSimilarMovieEndPoint)
  Future<MovieByGenreRespone> getSimilarMovieRespone(
    @Query(kApiKey) String apiKey,
    @Query(kPageKey) int page,
    @Path(kPathParameter) int movieId
  );
}
