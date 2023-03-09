// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieVoAdapter extends TypeAdapter<MovieVo> {
  @override
  final int typeId = 1;

  @override
  MovieVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieVo(
      fields[0] as bool?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<int>(),
      fields[3] as int?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as num?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as bool?,
      fields[12] as num?,
      fields[13] as num?,
      isGetNowPlaying: fields[14] as bool?,
      isPopularMovies: fields[15] as bool?,
      isTopRated: fields[16] as bool?,
      isgetMovieByGenre: fields[17] as bool?,
      isSimilarMovie: fields[18] as bool?,
    )..order = fields[19] as int?;
  }

  @override
  void write(BinaryWriter writer, MovieVo obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genreIDs)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.voteAverage)
      ..writeByte(13)
      ..write(obj.voteCount)
      ..writeByte(14)
      ..write(obj.isGetNowPlaying)
      ..writeByte(15)
      ..write(obj.isPopularMovies)
      ..writeByte(16)
      ..write(obj.isTopRated)
      ..writeByte(17)
      ..write(obj.isgetMovieByGenre)
      ..writeByte(18)
      ..write(obj.isSimilarMovie)
      ..writeByte(19)
      ..write(obj.order);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVo _$MovieVoFromJson(Map<String, dynamic> json) => MovieVo(
      json['adult'] as bool?,
      json['backdrop_path'] as String?,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['id'] as int?,
      json['original_language'] as String?,
      json['original_title'] as String?,
      json['overview'] as String?,
      json['popularity'] as num?,
      json['poster_path'] as String?,
      json['release_date'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
      json['vote_average'] as num?,
      json['vote_count'] as num?,
      isGetNowPlaying: json['isGetNowPlaying'] as bool? ?? false,
      isPopularMovies: json['isPopularMovies'] as bool? ?? false,
      isTopRated: json['isTopRated'] as bool? ?? false,
      isgetMovieByGenre: json['isgetMovieByGenre'] as bool? ?? false,
      isSimilarMovie: json['isSimilarMovie'] as bool? ?? false,
    )..order = json['order'] as int?;

Map<String, dynamic> _$MovieVoToJson(MovieVo instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIDs,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'isGetNowPlaying': instance.isGetNowPlaying,
      'isPopularMovies': instance.isPopularMovies,
      'isTopRated': instance.isTopRated,
      'isgetMovieByGenre': instance.isgetMovieByGenre,
      'isSimilarMovie': instance.isSimilarMovie,
      'order': instance.order,
    };
