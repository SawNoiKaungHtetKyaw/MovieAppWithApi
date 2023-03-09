import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/data/vos/movie_vo.dart';
import 'package:movie_project/network/respone/dates_vo.dart';

part 'movie_respone.g.dart';

@JsonSerializable()
class MovieRespone {
  @JsonKey(name: "dates")
  DatesVo? dates;

  @JsonKey(name: "page")
  int? page;

  @JsonKey(name: "results")
  List<MovieVo>? results;

  @JsonKey(name: "total_pages")
  int? totalPages;

  @JsonKey(name: "total_results")
  int? totalResult;

  MovieRespone(
      this.dates, this.page, this.results, this.totalPages, this.totalResult);

  factory MovieRespone.fromJson(Map<String, dynamic> json) =>
      _$MovieResponeFromJson(json);
}

/**
 {
    "dates": {
        "maximum": "2023-02-20",
        "minimum": "2023-01-03"
    },
    "page": 1,
    "results": [],
    "total_pages": 68,
    "total_results": 1356
}
 */