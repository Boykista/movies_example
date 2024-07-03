// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../movie_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoviePreview _$MoviePreviewFromJson(Map<String, dynamic> json) {
  return _MoviePreview.fromJson(json);
}

/// @nodoc
mixin _$MoviePreview {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  @BackdropImageUrlConverter()
  String? get backdropImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  @DateTimeConverter()
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviePreviewCopyWith<MoviePreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviePreviewCopyWith<$Res> {
  factory $MoviePreviewCopyWith(
          MoviePreview value, $Res Function(MoviePreview) then) =
      _$MoviePreviewCopyWithImpl<$Res, MoviePreview>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'backdrop_path')
      @BackdropImageUrlConverter()
      String? backdropImageUrl,
      @JsonKey(name: 'release_date') @DateTimeConverter() DateTime? releaseDate,
      String title,
      @JsonKey(name: 'vote_average') double rating});
}

/// @nodoc
class _$MoviePreviewCopyWithImpl<$Res, $Val extends MoviePreview>
    implements $MoviePreviewCopyWith<$Res> {
  _$MoviePreviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backdropImageUrl = freezed,
    Object? releaseDate = freezed,
    Object? title = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backdropImageUrl: freezed == backdropImageUrl
          ? _value.backdropImageUrl
          : backdropImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoviePreviewImplCopyWith<$Res>
    implements $MoviePreviewCopyWith<$Res> {
  factory _$$MoviePreviewImplCopyWith(
          _$MoviePreviewImpl value, $Res Function(_$MoviePreviewImpl) then) =
      __$$MoviePreviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'backdrop_path')
      @BackdropImageUrlConverter()
      String? backdropImageUrl,
      @JsonKey(name: 'release_date') @DateTimeConverter() DateTime? releaseDate,
      String title,
      @JsonKey(name: 'vote_average') double rating});
}

/// @nodoc
class __$$MoviePreviewImplCopyWithImpl<$Res>
    extends _$MoviePreviewCopyWithImpl<$Res, _$MoviePreviewImpl>
    implements _$$MoviePreviewImplCopyWith<$Res> {
  __$$MoviePreviewImplCopyWithImpl(
      _$MoviePreviewImpl _value, $Res Function(_$MoviePreviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backdropImageUrl = freezed,
    Object? releaseDate = freezed,
    Object? title = null,
    Object? rating = null,
  }) {
    return _then(_$MoviePreviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backdropImageUrl: freezed == backdropImageUrl
          ? _value.backdropImageUrl
          : backdropImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoviePreviewImpl implements _MoviePreview {
  const _$MoviePreviewImpl(
      {required this.id,
      @JsonKey(name: 'backdrop_path')
      @BackdropImageUrlConverter()
      required this.backdropImageUrl,
      @JsonKey(name: 'release_date')
      @DateTimeConverter()
      required this.releaseDate,
      required this.title,
      @JsonKey(name: 'vote_average') required this.rating});

  factory _$MoviePreviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoviePreviewImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'backdrop_path')
  @BackdropImageUrlConverter()
  final String? backdropImageUrl;
  @override
  @JsonKey(name: 'release_date')
  @DateTimeConverter()
  final DateTime? releaseDate;
  @override
  final String title;
  @override
  @JsonKey(name: 'vote_average')
  final double rating;

  @override
  String toString() {
    return 'MoviePreview(id: $id, backdropImageUrl: $backdropImageUrl, releaseDate: $releaseDate, title: $title, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviePreviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.backdropImageUrl, backdropImageUrl) ||
                other.backdropImageUrl == backdropImageUrl) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, backdropImageUrl, releaseDate, title, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviePreviewImplCopyWith<_$MoviePreviewImpl> get copyWith =>
      __$$MoviePreviewImplCopyWithImpl<_$MoviePreviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoviePreviewImplToJson(
      this,
    );
  }
}

abstract class _MoviePreview implements MoviePreview {
  const factory _MoviePreview(
          {required final int id,
          @JsonKey(name: 'backdrop_path')
          @BackdropImageUrlConverter()
          required final String? backdropImageUrl,
          @JsonKey(name: 'release_date')
          @DateTimeConverter()
          required final DateTime? releaseDate,
          required final String title,
          @JsonKey(name: 'vote_average') required final double rating}) =
      _$MoviePreviewImpl;

  factory _MoviePreview.fromJson(Map<String, dynamic> json) =
      _$MoviePreviewImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'backdrop_path')
  @BackdropImageUrlConverter()
  String? get backdropImageUrl;
  @override
  @JsonKey(name: 'release_date')
  @DateTimeConverter()
  DateTime? get releaseDate;
  @override
  String get title;
  @override
  @JsonKey(name: 'vote_average')
  double get rating;
  @override
  @JsonKey(ignore: true)
  _$$MoviePreviewImplCopyWith<_$MoviePreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
