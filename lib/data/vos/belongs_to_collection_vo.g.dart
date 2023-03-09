// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belongs_to_collection_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BelongsToCollectionVoAdapter extends TypeAdapter<BelongsToCollectionVo> {
  @override
  final int typeId = 5;

  @override
  BelongsToCollectionVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BelongsToCollectionVo(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BelongsToCollectionVo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.backdropPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BelongsToCollectionVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BelongsToCollectionVo _$BelongsToCollectionVoFromJson(
        Map<String, dynamic> json) =>
    BelongsToCollectionVo(
      json['id'] as int?,
      json['name'] as String?,
      json['poster_path'] as String?,
      json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$BelongsToCollectionVoToJson(
        BelongsToCollectionVo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
    };
