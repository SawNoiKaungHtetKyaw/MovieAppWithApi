import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/constants/hive_constants.dart';

part 'genre_id_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveGenreIdType)
class GenreIdVo {
  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  @HiveField(2)
  int? order;

  GenreIdVo(this.id, this.name);

  factory GenreIdVo.fromJson(Map<String, dynamic> json) =>
      _$GenreIdVoFromJson(json);
}
