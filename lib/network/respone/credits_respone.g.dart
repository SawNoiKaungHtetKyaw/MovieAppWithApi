// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_respone.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditsResponeAdapter extends TypeAdapter<CreditsRespone> {
  @override
  final int typeId = 13;

  @override
  CreditsRespone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditsRespone(
      fields[0] as int?,
      (fields[1] as List?)?.cast<CastVo>(),
      (fields[2] as List?)?.cast<CrewVo>(),
    );
  }

  @override
  void write(BinaryWriter writer, CreditsRespone obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cast)
      ..writeByte(2)
      ..write(obj.crew);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditsResponeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditsRespone _$CreditsResponeFromJson(Map<String, dynamic> json) =>
    CreditsRespone(
      json['id'] as int?,
      (json['cast'] as List<dynamic>?)
          ?.map((e) => CastVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => CrewVo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreditsResponeToJson(CreditsRespone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
