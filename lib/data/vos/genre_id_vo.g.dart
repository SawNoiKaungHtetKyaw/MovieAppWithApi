// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_id_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenreIdVoAdapter extends TypeAdapter<GenreIdVo> {
  @override
  final int typeId = 9;

  @override
  GenreIdVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenreIdVo(
      fields[0] as int?,
      fields[1] as String?,
    )..order = fields[2] as int?;
  }

  @override
  void write(BinaryWriter writer, GenreIdVo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.order);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreIdVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreIdVo _$GenreIdVoFromJson(Map<String, dynamic> json) => GenreIdVo(
      json['id'] as int?,
      json['name'] as String?,
    )..order = json['order'] as int?;

Map<String, dynamic> _$GenreIdVoToJson(GenreIdVo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
    };
