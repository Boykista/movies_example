import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_example/screens/movies_screen/bloc/movies_screen_state.dart';
import 'package:movies_example/shared/locator.dart';
import 'package:movies_example/services/api_service/api_service.dart';
import 'package:movies_example/shared/entities/movie_preview.dart';
import 'package:movies_example/shared/entities/movies_response.dart';
import 'package:movies_example/utils/debug_logger.dart';

class MoviesScreenCubit extends Cubit<MoviesScreenState> {
  final ScrollController scrollController = ScrollController();
  int? _totalNumberOfPages;
  final moviesApi = locator<ApiService>().moviesApi;

  MoviesScreenCubit() : super(MoviesScreenState()) {
    getInitialMovies();
    shouldLoadMoreData();
  }

  @override
  close() {
    scrollController.dispose();
    return super.close();
  }

  Future<List<MoviePreview>> _getMovies({required int page}) async {
    final response = await moviesApi.getMoviesList(page: page);
    final data = response.data as Map<String, Object?>;
    final moviesResponse = MoviesResponse.fromJson(data);
    final movies = moviesResponse.movies;
    _totalNumberOfPages ??= moviesResponse.totalPages;

    return movies;
  }

  void shouldLoadMoreData() {
    scrollController.addListener(() async {
      final offset = scrollController.offset;
      final maxExtent = scrollController.position.maxScrollExtent;

      if (offset >= maxExtent && state is DataState) {
        await loadMoreMovies();
      }
    });
  }

  Future<void> getInitialMovies() async {
    emit(LoadingState());

    try {
      final movies = await _getMovies(page: 1);

      emit(DataState(movies: movies, currentPage: state.currentPage));
    } catch (e) {
      DebugLogger.log(e);
      emit(ErrorState());
    }
  }

  Future<void> loadMoreMovies() async {
    final currentPage = state.currentPage;
    final newPage = currentPage + 1;
    if (newPage > _totalNumberOfPages!) {
      return;
    }
    List<MoviePreview> movies = List.from(state.movies);

    emit(LoadMoreState(movies: movies, currentPage: currentPage));

    try {
      final newMovies = await _getMovies(page: newPage);
      movies.addAll(newMovies);

      emit(DataState(movies: movies, currentPage: newPage));
    } catch (e) {
      DebugLogger.log(e);

      emit(ErrorLoadMoreToast(
        message: 'Dogodila se greška.',
        currentPage: currentPage,
        movies: movies,
      ));
    }
  }

  void refresh() {
    getInitialMovies();
  }

  void onToastDismiss() {
    emit(DataState(
      movies: state.movies,
      currentPage: state.currentPage,
    ));
  }
}
