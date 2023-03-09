// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_respone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorsRespone _$ActorsResponeFromJson(Map<String, dynamic> json) =>
    ActorsRespone(
      json['page'] as int?,
      (json['results'] as List<dynamic>?)
          ?.map((e) => ActorsVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_pages'] as int?,
      json['total_results'] as int?,
    );

Map<String, dynamic> _$ActorsResponeToJson(ActorsRespone instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
