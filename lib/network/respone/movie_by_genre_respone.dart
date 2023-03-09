import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/data/vos/movie_vo.dart';

import '../../constants/hive_constants.dart';

part 'movie_by_genre_respone.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveMovieByGenresResponeType)
class MovieByGenreRespone {
  @JsonKey(name: "page")
  @HiveField(0)
  int? page;

  @JsonKey(name: "results")
  @HiveField(1)
  List<MovieVo>? results;

  @JsonKey(name: "total_pages")
  @HiveField(3)
  num? totalPages;

  @JsonKey(name: "total_results")
  @HiveField(4)
  num? totalResults;

  MovieByGenreRespone(
      this.page, this.results, this.totalPages, this.totalResults);

  factory MovieByGenreRespone.fromJson(Map<String, dynamic> json) =>
      _$MovieByGenreResponeFromJson(json);
}
