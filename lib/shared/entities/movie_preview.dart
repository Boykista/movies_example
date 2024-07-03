// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_example/shared/entities/json_converters/date_time_converter.dart';
import 'package:movies_example/shared/entities/json_converters/poster_image_url_converter.dart';

part 'generated/movie_preview.freezed.dart';
part 'generated/movie_preview.g.dart';

@freezed
class MoviePreview with _$MoviePreview {
  const factory MoviePreview({
    required int id,
    @JsonKey(name: 'backdrop_path')
    @BackdropImageUrlConverter()
    required String? backdropImageUrl,
    @JsonKey(name: 'release_date')
    @DateTimeConverter()
    required DateTime? releaseDate,
    required String title,
    @JsonKey(name: 'vote_average') required double rating,
  }) = _MoviePreview;

  factory MoviePreview.fromJson(Map<String, Object?> json) =>
      _$MoviePreviewFromJson(json);
}
