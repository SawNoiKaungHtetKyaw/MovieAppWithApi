// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsVoAdapter extends TypeAdapter<MovieDetailsVo> {
  @override
  final int typeId = 4;

  @override
  MovieDetailsVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsVo(
      fields[0] as bool?,
      fields[1] as String?,
      fields[2] as BelongsToCollectionVo?,
      fields[3] as int?,
      (fields[4] as List?)?.cast<GenreIdVo>(),
      fields[5] as String?,
      fields[6] as int?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as double?,
      fields[12] as String?,
      (fields[13] as List?)?.cast<ProductionCompaniesVo>(),
      (fields[14] as List?)?.cast<ProductionCountriesVo>(),
      fields[15] as String?,
      fields[16] as int?,
      fields[17] as int?,
      (fields[18] as List?)?.cast<SpokenLanguagesVo>(),
      fields[19] as String?,
      fields[20] as String?,
      fields[21] as String?,
      fields[22] as bool?,
      fields[23] as double?,
      fields[24] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsVo obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.belongsToCollection)
      ..writeByte(3)
      ..write(obj.budget)
      ..writeByte(4)
      ..write(obj.genres)
      ..writeByte(5)
      ..write(obj.homepage)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.imdbId)
      ..writeByte(8)
      ..write(obj.originalLanguage)
      ..writeByte(9)
      ..write(obj.originalTitle)
      ..writeByte(10)
      ..write(obj.overview)
      ..writeByte(11)
      ..write(obj.popularity)
      ..writeByte(12)
      ..write(obj.posterPath)
      ..writeByte(13)
      ..write(obj.productionCompanies)
      ..writeByte(14)
      ..write(obj.productionCountries)
      ..writeByte(15)
      ..write(obj.releaseDate)
      ..writeByte(16)
      ..write(obj.revenue)
      ..writeByte(17)
      ..write(obj.runtime)
      ..writeByte(18)
      ..write(obj.spokenLanguages)
      ..writeByte(19)
      ..write(obj.status)
      ..writeByte(20)
      ..write(obj.tagline)
      ..writeByte(21)
      ..write(obj.title)
      ..writeByte(22)
      ..write(obj.video)
      ..writeByte(23)
      ..write(obj.voteAverage)
      ..writeByte(24)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsVo _$MovieDetailsVoFromJson(Map<String, dynamic> json) =>
    MovieDetailsVo(
      json['adult'] as bool?,
      json['backdrop_path'] as String?,
      json['belongs_to_collection'] == null
          ? null
          : BelongsToCollectionVo.fromJson(
              json['belongs_to_collection'] as Map<String, dynamic>),
      json['budget'] as int?,
      (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreIdVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['homepage'] as String?,
      json['id'] as int?,
      json['imdb_id'] as String?,
      json['original_language'] as String?,
      json['original_title'] as String?,
      json['overview'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['poster_path'] as String?,
      (json['production_companies'] as List<dynamic>?)
          ?.map(
              (e) => ProductionCompaniesVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['production_countries'] as List<dynamic>?)
          ?.map(
              (e) => ProductionCountriesVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['release_date'] as String?,
      json['revenue'] as int?,
      json['runtime'] as int?,
      (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguagesVo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String?,
      json['tagline'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
      (json['vote_average'] as num?)?.toDouble(),
      json['vote_count'] as int?,
    );

Map<String, dynamic> _$MovieDetailsVoToJson(MovieDetailsVo instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
