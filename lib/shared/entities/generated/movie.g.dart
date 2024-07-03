// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: (json['id'] as num).toInt(),
      backdropImageUrl: const BackdropImageUrlConverter()
          .fromJson(json['backdrop_path'] as String),
      releaseDate:
          const DateTimeConverter().fromJson(json['release_date'] as String?),
      title: json['title'] as String,
      overview: json['overview'] as String,
      rating: (json['vote_average'] as num).toDouble(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => MovieGenre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_path':
          const BackdropImageUrlConverter().toJson(instance.backdropImageUrl),
      'release_date': const DateTimeConverter().toJson(instance.releaseDate),
      'title': instance.title,
      'overview': instance.overview,
      'vote_average': instance.rating,
      'genres': instance.genres,
    };
