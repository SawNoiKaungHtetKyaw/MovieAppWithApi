// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActorsVoAdapter extends TypeAdapter<ActorsVo> {
  @override
  final int typeId = 2;

  @override
  ActorsVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActorsVo(
      fields[0] as bool?,
      fields[1] as int?,
      fields[2] as int?,
      (fields[3] as List?)?.cast<KnownForVo>(),
      fields[4] as String?,
      fields[6] as num?,
      fields[7] as String?,
    )
      ..name = fields[5] as String?
      ..order = fields[8] as int?;
  }

  @override
  void write(BinaryWriter writer, ActorsVo obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.knownFor)
      ..writeByte(4)
      ..write(obj.knownForDepartment)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.profilePath)
      ..writeByte(8)
      ..write(obj.order);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorsVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorsVo _$ActorsVoFromJson(Map<String, dynamic> json) => ActorsVo(
      json['adult'] as bool?,
      json['gender'] as int?,
      json['id'] as int?,
      (json['known_for'] as List<dynamic>?)
          ?.map((e) => KnownForVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['known_for_department'] as String?,
      json['popularity'] as num?,
      json['profile_path'] as String?,
    )
      ..name = json['name'] as String?
      ..order = json['order'] as int?;

Map<String, dynamic> _$ActorsVoToJson(ActorsVo instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for': instance.knownFor,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'order': instance.order,
    };
