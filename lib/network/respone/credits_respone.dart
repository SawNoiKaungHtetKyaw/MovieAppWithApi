import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/constants/hive_constants.dart';
import 'package:movie_project/data/vos/cast_vo.dart';
import 'package:movie_project/data/vos/crew_vo.dart';

part 'credits_respone.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveCreditResponeType)
class CreditsRespone {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'cast')
  @HiveField(1)
  List<CastVo>? cast;

  @JsonKey(name: 'crew')
  @HiveField(2)
  List<CrewVo>? crew;

  CreditsRespone(this.id, this.cast, this.crew);

  factory CreditsRespone.fromJson(Map<String, dynamic> json) =>
      _$CreditsResponeFromJson(json);
}

/**
 {
    "id": 568124,
    "cast": [],
    "crew": []
}
 */