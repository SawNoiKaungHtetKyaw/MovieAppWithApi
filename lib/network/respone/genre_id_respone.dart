import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/data/vos/genre_id_vo.dart';

part 'genre_id_respone.g.dart';

@JsonSerializable()
// @HiveType(typeId: kHiveGenresIdResponeType)
class GenreIdRespone {
  @JsonKey(name: "genres")
  // @HiveField(0)
  List<GenreIdVo>? genres;

  GenreIdRespone(this.genres);

  factory GenreIdRespone.fromJson(Map<String, dynamic> json) =>
      _$GenreIdResponeFromJson(json);
}
