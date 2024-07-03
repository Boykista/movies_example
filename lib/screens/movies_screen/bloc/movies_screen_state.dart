import 'package:movies_example/shared/entities/movie_preview.dart';

class MoviesScreenState {
  final List<MoviePreview> movies;
  final int currentPage;

  MoviesScreenState({
    this.movies = const [],
    this.currentPage = 1,
  });
}

class DataState extends MoviesScreenState {
  DataState({
    required super.movies,
    required super.currentPage,
  });
}

class LoadingState extends MoviesScreenState {
  LoadingState({
    super.movies = const [],
    super.currentPage = 1,
  });
}

class ErrorState extends MoviesScreenState {
  ErrorState({
    super.movies = const [],
    super.currentPage = 1,
  });
}

class LoadMoreState extends MoviesScreenState {
  LoadMoreState({
    required super.movies,
    required super.currentPage,
  });
}

class ErrorLoadMoreToast extends MoviesScreenState {
  final String message;

  ErrorLoadMoreToast({
    required this.message,
    required super.currentPage,
    required super.movies,
  });
}
