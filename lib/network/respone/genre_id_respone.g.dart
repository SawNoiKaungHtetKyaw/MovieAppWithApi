// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_id_respone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreIdRespone _$GenreIdResponeFromJson(Map<String, dynamic> json) =>
    GenreIdRespone(
      (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreIdVo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenreIdResponeToJson(GenreIdRespone instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
