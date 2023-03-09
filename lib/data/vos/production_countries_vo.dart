
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/constants/hive_constants.dart';

part 'production_countries_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveProductionCountriesType)
class ProductionCountriesVo {

  @JsonKey(name: 'iso_3166_1')
  @HiveField(0)
  String? iso31661;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  ProductionCountriesVo(this.iso31661, this.name);

  factory ProductionCountriesVo.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesVoFromJson(json);
}