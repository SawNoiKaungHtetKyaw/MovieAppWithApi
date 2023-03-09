
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/constants/hive_constants.dart';

part 'crew_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveCrewType)
class CrewVo {

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

  @JsonKey(name: 'credit_id')
  @HiveField(8)
  String? creditId;

  @JsonKey(name: 'department')
  @HiveField(9)
  String? department;

  @JsonKey(name: 'job')
  @HiveField(10)
  String? job;

  CrewVo(
      this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job);

  factory CrewVo.fromJson(Map<String, dynamic> json) => _$CrewVoFromJson(json);
}
/**
 {
            "adult": false,
            "gender": 0,
            "id": 8159,
            "known_for_department": "Sound",
            "name": "Shannon Mills",
            "original_name": "Shannon Mills",
            "popularity": 1.577,
            "profile_path": null,
            "credit_id": "618c6fc91cfe3a0042296490",
            "department": "Sound",
            "job": "Supervising Sound Editor"
        },
 */