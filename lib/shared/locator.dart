import 'package:get_it/get_it.dart';
import 'package:movies_example/shared/blocs/read_more_bloc/read_more_cubit.dart';
import 'package:movies_example/services/api_service/api_service.dart';
import 'package:movies_example/shared/models/movie_genre_helper.dart';
import 'package:movies_example/utils/utils.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiService());
  locator.registerSingleton(Utils());
  locator.registerFactoryParam<ReadMoreCubit, int, void>(
      (maxLines, _) => ReadMoreCubit(maxLines: maxLines));
  locator.registerLazySingleton(() => MovieGenreHelper());
}
