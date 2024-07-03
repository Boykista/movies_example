// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_example/shared/entities/json_converters/date_time_converter.dart';
import 'package:movies_example/shared/entities/json_converters/poster_image_url_converter.dart';
import 'package:movies_example/shared/entities/movie_genre.dart';

part 'generated/movie.freezed.dart';
part 'generated/movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    @JsonKey(name: 'backdrop_path')
    @BackdropImageUrlConverter()
    required String backdropImageUrl,
    @JsonKey(name: 'release_date')
    @DateTimeConverter()
    required DateTime? releaseDate,
    required String title,
    required String overview,
    @JsonKey(name: 'vote_average') required double rating,
    required List<MovieGenre> genres,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
