import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/constants/hive_constants.dart';

part 'movie_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveMovieType)
class MovieVo {
  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'backdrop_path')
  @HiveField(1)
  String? backdropPath;

  @JsonKey(name: 'genre_ids')
  @HiveField(2)
  List<int>? genreIDs;

  @JsonKey(name: 'id')
  @HiveField(3)
  int? id;

  @JsonKey(name: 'original_language')
  @HiveField(4)
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  @HiveField(5)
  String? originalTitle;

  @JsonKey(name: 'overview')
  @HiveField(6)
  String? overview;

  @JsonKey(name: 'popularity')
  @HiveField(7)
  num? popularity;

  @JsonKey(name: 'poster_path')
  @HiveField(8)
  String? posterPath;

  @JsonKey(name: 'release_date')
  @HiveField(9)
  String? releaseDate;

  @JsonKey(name: 'title')
  @HiveField(10)
  String? title;

  @JsonKey(name: 'video')
  @HiveField(11)
  bool? video;

  @JsonKey(name: 'vote_average')
  @HiveField(12)
  num? voteAverage;

  @JsonKey(name: 'vote_count')
  @HiveField(13)
  num? voteCount;

  @HiveField(14)
  bool? isGetNowPlaying;

  @HiveField(15)
  bool? isPopularMovies;

  @HiveField(16)
  bool? isTopRated;

  @HiveField(17)
  bool? isgetMovieByGenre;

  @HiveField(18)
  bool? isSimilarMovie;

  @HiveField(19)
  int? order;

  MovieVo(
      this.adult,
      this.backdropPath,
      this.genreIDs,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      {this.isGetNowPlaying = false,
      this.isPopularMovies = false,
      this.isTopRated = false,
      this.isgetMovieByGenre = false,
      this.isSimilarMovie = false});

  factory MovieVo.fromJson(Map<String, dynamic> json) =>
      _$MovieVoFromJson(json);

  @override
  String toString() {
    return 'MovieVo(title : $title)';
  }
}
