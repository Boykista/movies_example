import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_example/screens/movie_details_screen/bloc/movie_details_screen_state.dart';
import 'package:movies_example/shared/locator.dart';
import 'package:movies_example/services/api_service/api/movies_api.dart';
import 'package:movies_example/services/api_service/api_service.dart';
import 'package:movies_example/shared/entities/movie.dart';
import 'package:movies_example/shared/entities/movie_genre.dart';
import 'package:movies_example/shared/models/movie_genre_helper.dart';
import 'package:movies_example/utils/debug_logger.dart';
import 'package:movies_example/utils/utils.dart';

class MovieDetailsScreenCubit extends Cubit<MovieDetailsScreenState> {
  final int movieId;
  final MoviesApi moviesApi = locator<ApiService>().moviesApi;
  final Utils utils = locator<Utils>();

  MovieDetailsScreenCubit({required this.movieId})
      : super(MovieDetailsScreenState()) {
    getMovie(movieId);
  }

  Future<Movie> _getMovie({required int id}) async {
    final response = await moviesApi.getMovie(id: id);
    final data = response.data as Map<String, Object?>;
    final movie = Movie.fromJson(data);

    return movie;
  }

  Future<void> getMovie(int movieId) async {
    emit(LoadingState());

    try {
      final movie = await _getMovie(id: movieId);

      emit(DataState(movie: movie));
    } catch (e) {
      DebugLogger.log(e);
      emit(ErrorState());
    }
  }

  void refresh() {
    getMovie(movieId);
  }

  String getGenre(List<MovieGenre> movieGenres) {
    final ids = movieGenres.map((e) => e.id).toList();
    final genres = MovieGenreHelper.getFromIds(ids);
    return genres.join(', ');
  }

  String formatDate(DateTime date) {
    return utils.formatDate(date);
  }
}
