import 'package:movies_example/shared/entities/movie.dart';

class MovieDetailsScreenState {}

class DataState extends MovieDetailsScreenState {
  final Movie movie;
  DataState({required this.movie});
}

class LoadingState extends MovieDetailsScreenState {}

class ErrorState extends MovieDetailsScreenState {}
