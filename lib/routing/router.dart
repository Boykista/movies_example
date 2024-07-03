import 'package:go_router/go_router.dart';
import 'package:movies_example/routing/routes/route_params.dart';
import 'package:movies_example/routing/routes/routes.dart';
import 'package:movies_example/screens/movie_details_screen/movie_details_screen.dart';
import 'package:movies_example/screens/movies_screen/movies_screen.dart';
import 'package:movies_example/shared/ui_components/error_routing_display.dart';

final router = GoRouter(
  initialLocation: Routes.movies,
  errorBuilder: (context, state) =>
      ErrorRoutingDisplay(route: state.matchedLocation),
  routes: [
    GoRoute(
      path: Routes.movies,
      builder: (context, state) => const MoviesScreen(),
      routes: [
        GoRoute(
          path: ':${RouteParams.id}',
          builder: (context, state) {
            final idString = state.pathParameters[RouteParams.id] as String;
            final id = int.parse(idString);

            return MovieDetailsScreen(id: id);
          },
        ),
      ],
    ),
  ],
);
