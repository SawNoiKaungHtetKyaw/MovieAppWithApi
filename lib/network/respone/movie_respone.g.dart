// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_respone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieRespone _$MovieResponeFromJson(Map<String, dynamic> json) => MovieRespone(
      json['dates'] == null
          ? null
          : DatesVo.fromJson(json['dates'] as Map<String, dynamic>),
      json['page'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int?,
      json['total_results'] as int?,
    );

Map<String, dynamic> _$MovieResponeToJson(MovieRespone instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResult,
    };
