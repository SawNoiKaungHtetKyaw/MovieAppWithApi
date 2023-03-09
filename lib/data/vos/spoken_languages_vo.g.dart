// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_languages_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpokenLanguagesVoAdapter extends TypeAdapter<SpokenLanguagesVo> {
  @override
  final int typeId = 8;

  @override
  SpokenLanguagesVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpokenLanguagesVo(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SpokenLanguagesVo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.englishName)
      ..writeByte(1)
      ..write(obj.iso6391)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpokenLanguagesVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpokenLanguagesVo _$SpokenLanguagesVoFromJson(Map<String, dynamic> json) =>
    SpokenLanguagesVo(
      json['english_name'] as String?,
      json['iso_639_1'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguagesVoToJson(SpokenLanguagesVo instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };
