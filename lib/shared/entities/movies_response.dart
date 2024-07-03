// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_example/shared/entities/movie_preview.dart';

part 'generated/movies_response.freezed.dart';
part 'generated/movies_response.g.dart';

@freezed
class MoviesResponse with _$MoviesResponse {
  const factory MoviesResponse({
    required int page,
    @JsonKey(name: 'results') required List<MoviePreview> movies,
    @JsonKey(name: 'total_pages') required int totalPages,
  }) = _MoviesResponse;

  factory MoviesResponse.fromJson(Map<String, Object?> json) =>
      _$MoviesResponseFromJson(json);
}
