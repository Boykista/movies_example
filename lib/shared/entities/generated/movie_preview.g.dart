// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../movie_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoviePreviewImpl _$$MoviePreviewImplFromJson(Map<String, dynamic> json) =>
    _$MoviePreviewImpl(
      id: (json['id'] as num).toInt(),
      backdropImageUrl: _$JsonConverterFromJson<String, String>(
          json['backdrop_path'], const BackdropImageUrlConverter().fromJson),
      releaseDate:
          const DateTimeConverter().fromJson(json['release_date'] as String?),
      title: json['title'] as String,
      rating: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$$MoviePreviewImplToJson(_$MoviePreviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_path': _$JsonConverterToJson<String, String>(
          instance.backdropImageUrl, const BackdropImageUrlConverter().toJson),
      'release_date': const DateTimeConverter().toJson(instance.releaseDate),
      'title': instance.title,
      'vote_average': instance.rating,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
