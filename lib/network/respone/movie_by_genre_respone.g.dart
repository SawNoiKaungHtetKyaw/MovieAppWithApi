// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_by_genre_respone.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieByGenreResponeAdapter extends TypeAdapter<MovieByGenreRespone> {
  @override
  final int typeId = 14;

  @override
  MovieByGenreRespone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieByGenreRespone(
      fields[0] as int?,
      (fields[1] as List?)?.cast<MovieVo>(),
      fields[3] as num?,
      fields[4] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieByGenreRespone obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.results)
      ..writeByte(3)
      ..write(obj.totalPages)
      ..writeByte(4)
      ..write(obj.totalResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieByGenreResponeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieByGenreRespone _$MovieByGenreResponeFromJson(Map<String, dynamic> json) =>
    MovieByGenreRespone(
      json['page'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as num?,
      json['total_results'] as num?,
    );

Map<String, dynamic> _$MovieByGenreResponeToJson(
        MovieByGenreRespone instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
