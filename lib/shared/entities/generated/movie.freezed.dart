// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return _Movie.fromJson(json);
}

/// @nodoc
mixin _$Movie {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  @BackdropImageUrlConverter()
  String get backdropImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  @DateTimeConverter()
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double get rating => throw _privateConstructorUsedError;
  List<MovieGenre> get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res, Movie>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'backdrop_path')
      @BackdropImageUrlConverter()
      String backdropImageUrl,
      @JsonKey(name: 'release_date') @DateTimeConverter() DateTime? releaseDate,
      String title,
      String overview,
      @JsonKey(name: 'vote_average') double rating,
      List<MovieGenre> genres});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res, $Val extends Movie>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backdropImageUrl = null,
    Object? releaseDate = freezed,
    Object? title = null,
    Object? overview = null,
    Object? rating = null,
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backdropImageUrl: null == backdropImageUrl
          ? _value.backdropImageUrl
          : backdropImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<MovieGenre>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieImplCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$MovieImplCopyWith(
          _$MovieImpl value, $Res Function(_$MovieImpl) then) =
      __$$MovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'backdrop_path')
      @BackdropImageUrlConverter()
      String backdropImageUrl,
      @JsonKey(name: 'release_date') @DateTimeConverter() DateTime? releaseDate,
      String title,
      String overview,
      @JsonKey(name: 'vote_average') double rating,
      List<MovieGenre> genres});
}

/// @nodoc
class __$$MovieImplCopyWithImpl<$Res>
    extends _$MovieCopyWithImpl<$Res, _$MovieImpl>
    implements _$$MovieImplCopyWith<$Res> {
  __$$MovieImplCopyWithImpl(
      _$MovieImpl _value, $Res Function(_$MovieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? backdropImageUrl = null,
    Object? releaseDate = freezed,
    Object? title = null,
    Object? overview = null,
    Object? rating = null,
    Object? genres = null,
  }) {
    return _then(_$MovieImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      backdropImageUrl: null == backdropImageUrl
          ? _value.backdropImageUrl
          : backdropImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<MovieGenre>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieImpl implements _Movie {
  const _$MovieImpl(
      {required this.id,
      @JsonKey(name: 'backdrop_path')
      @BackdropImageUrlConverter()
      required this.backdropImageUrl,
      @JsonKey(name: 'release_date')
      @DateTimeConverter()
      required this.releaseDate,
      required this.title,
      required this.overview,
      @JsonKey(name: 'vote_average') required this.rating,
      required final List<MovieGenre> genres})
      : _genres = genres;

  factory _$MovieImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'backdrop_path')
  @BackdropImageUrlConverter()
  final String backdropImageUrl;
  @override
  @JsonKey(name: 'release_date')
  @DateTimeConverter()
  final DateTime? releaseDate;
  @override
  final String title;
  @override
  final String overview;
  @override
  @JsonKey(name: 'vote_average')
  final double rating;
  final List<MovieGenre> _genres;
  @override
  List<MovieGenre> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'Movie(id: $id, backdropImageUrl: $backdropImageUrl, releaseDate: $releaseDate, title: $title, overview: $overview, rating: $rating, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.backdropImageUrl, backdropImageUrl) ||
                other.backdropImageUrl == backdropImageUrl) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      backdropImageUrl,
      releaseDate,
      title,
      overview,
      rating,
      const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      __$$MovieImplCopyWithImpl<_$MovieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieImplToJson(
      this,
    );
  }
}

abstract class _Movie implements Movie {
  const factory _Movie(
      {required final int id,
      @JsonKey(name: 'backdrop_path')
      @BackdropImageUrlConverter()
      required final String backdropImageUrl,
      @JsonKey(name: 'release_date')
      @DateTimeConverter()
      required final DateTime? releaseDate,
      required final String title,
      required final String overview,
      @JsonKey(name: 'vote_average') required final double rating,
      required final List<MovieGenre> genres}) = _$MovieImpl;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$MovieImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'backdrop_path')
  @BackdropImageUrlConverter()
  String get backdropImageUrl;
  @override
  @JsonKey(name: 'release_date')
  @DateTimeConverter()
  DateTime? get releaseDate;
  @override
  String get title;
  @override
  String get overview;
  @override
  @JsonKey(name: 'vote_average')
  double get rating;
  @override
  List<MovieGenre> get genres;
  @override
  @JsonKey(ignore: true)
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
