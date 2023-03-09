import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/data/vos/actors_vo.dart';

part 'actors_respone.g.dart';

@JsonSerializable()
class ActorsRespone {
  @JsonKey(name: "page")
  int? page;

  @JsonKey(name: "results")
  List<ActorsVo>? results;

  @JsonKey(name: "total_pages")
  int? totalPages;

  @JsonKey(name: "total_results")
  int? totalResults;

  ActorsRespone(this.page, this.results, this.totalPages, this.totalResults);

  factory ActorsRespone.fromJson(Map<String, dynamic> json) =>
      _$ActorsResponeFromJson(json);
}
