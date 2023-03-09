import 'package:json_annotation/json_annotation.dart';

part 'dates_vo.g.dart';

@JsonSerializable()
class DatesVo {
  @JsonKey(name: "maximum")
  String? maximum;

  @JsonKey(name: "minimum")
  String? minimum;

  DatesVo(this.maximum, this.minimum);

  factory DatesVo.fromJson(Map<String, dynamic> json) =>
      _$DatesVoFromJson(json);
}
