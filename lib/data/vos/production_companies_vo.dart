
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_project/constants/hive_constants.dart';

part 'production_companies_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveProductionCompaniesType)
class ProductionCompaniesVo {

  @JsonKey(name : 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name : 'logo_path')
  @HiveField(1)
  String? logoPath;

  @JsonKey(name : 'name')
  @HiveField(2)
  String? name;

  @JsonKey(name : 'origin_country')
  @HiveField(3)
  String? originCountry;

  ProductionCompaniesVo(this.id, this.logoPath, this.name, this.originCountry);

  factory ProductionCompaniesVo.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesVoFromJson(json);
}