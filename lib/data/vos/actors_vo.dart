import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/constants/hive_constants.dart';
import 'package:movie_project/data/vos/known_for_vo.dart';

part 'actors_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveActorType)
class ActorsVo {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "gender")
  @HiveField(1)
  int? gender;

  @JsonKey(name: "id")
  @HiveField(2)
  int? id;

  @JsonKey(name: "known_for")
  @HiveField(3)
  List<KnownForVo>? knownFor;

  @JsonKey(name: "known_for_department")
  @HiveField(4)
  String? knownForDepartment;

  @JsonKey(name: "name")
  @HiveField(5)
  String? name;

  @JsonKey(name: "popularity")
  @HiveField(6)
  num? popularity;

  @JsonKey(name: "profile_path")
  @HiveField(7)
  String? profilePath;

  @HiveField(8)
  int? order;

  ActorsVo(this.adult, this.gender, this.id, this.knownFor,
      this.knownForDepartment, this.popularity, this.profilePath);

  factory ActorsVo.fromJson(Map<String, dynamic> json) =>
      _$ActorsVoFromJson(json);
}
