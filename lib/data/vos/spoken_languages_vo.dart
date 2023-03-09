
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/constants/hive_constants.dart';

part 'spoken_languages_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveSpokenLanguagesType)
class SpokenLanguagesVo {

  @JsonKey(name: 'english_name')
  @HiveField(0)
  String? englishName;

  @JsonKey(name: 'iso_639_1')
  @HiveField(1)
  String? iso6391;
  
  @JsonKey(name: 'name')
  @HiveField(2)
  String? name;

  SpokenLanguagesVo(this.englishName, this.iso6391, this.name);

  factory SpokenLanguagesVo.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesVoFromJson(json);
      
}