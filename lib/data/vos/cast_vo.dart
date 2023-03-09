
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/constants/hive_constants.dart';

part 'cast_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveCastType)
class CastVo {

  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'gender')
  @HiveField(1)
  int? gender;

  @JsonKey(name: 'id')
  @HiveField(2)
  int? id;

  @JsonKey(name: 'known_for_department')
  @HiveField(3)
  String? knownForDepartment;

  @JsonKey(name: 'name')
  @HiveField(4)
  String? name;

  @JsonKey(name: 'original_name')
  @HiveField(5)
  String? originalName;

  @JsonKey(name: 'popularity')
  @HiveField(6)
  num? popularity;

  @JsonKey(name: 'profile_path')
  @HiveField(7)
  String? profilePath;

  @JsonKey(name: 'cast_id')
  @HiveField(8)
  int? castId;

  @JsonKey(name: 'character')
  @HiveField(9)
  String? character;

  @JsonKey(name: 'credit_id')
  @HiveField(10)
  String? creditId;

  @JsonKey(name: 'order')
  @HiveField(11)
  int? order;

  CastVo(
      this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castId,
      this.character,
      this.creditId,
      this.order);

  factory CastVo.fromJson(Map<String, dynamic> json) => _$CastVoFromJson(json);
}

/**
  {
            "adult": false,
            "gender": 1,
            "id": 968367,
            "known_for_department": "Acting",
            "name": "Stephanie Beatriz",
            "original_name": "Stephanie Beatriz",
            "popularity": 22.505,
            "profile_path": "/pGo7zMGsMXOMSMZc68Xi3LvzeP0.jpg",
            "cast_id": 8,
            "character": "Mirabel Madrigal (voice)",
            "credit_id": "5fee8b5e176a94003fe4998a",
            "order": 0
        },
 */