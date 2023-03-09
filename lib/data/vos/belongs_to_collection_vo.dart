import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/constants/hive_constants.dart';

part 'belongs_to_collection_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveBelongsToCollectionType)
class BelongsToCollectionVo {

  @JsonKey(name : 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name : 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name : 'poster_path')
  @HiveField(2)
  String? posterPath;

  @JsonKey(name: 'backdrop_path')
  @HiveField(3)
  String? backdropPath;

  BelongsToCollectionVo(this.id, this.name, this.posterPath, this.backdropPath);

  factory BelongsToCollectionVo.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionVoFromJson(json);
}