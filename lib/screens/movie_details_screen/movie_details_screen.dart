import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movies_example/screens/movie_details_screen/bloc/movie_details_screen_cubit.dart';
import 'package:movies_example/screens/movie_details_screen/bloc/movie_details_screen_state.dart';
import 'package:movies_example/shared/blocs/read_more_bloc/read_more_cubit.dart';
import 'package:movies_example/shared/blocs/read_more_bloc/read_more_state.dart';
import 'package:movies_example/shared/locator.dart';

import 'package:movies_example/shared/ui_components/cached_url_image.dart';
import 'package:movies_example/shared/ui_components/header.dart';
import 'package:movies_example/shared/ui_components/screen_container.dart';
import 'package:movies_example/shared/ui_components/state_display/error_display.dart';
import 'package:movies_example/shared/ui_components/state_display/loader.dart';
import 'package:movies_example/shared/ui_components/ui_divider.dart';
import 'package:movies_example/shared/ui_components/ui_text.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;

  const MovieDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsScreenCubit(movieId: id),
      child: ScreenContainer(
        header: const Header(
          titleText: 'Detalji filma',
        ),
        body: BlocBuilder<MovieDetailsScreenCubit, MovieDetailsScreenState>(
          builder: (context, state) {
            final cubit = context.read<MovieDetailsScreenCubit>();

            if (state is LoadingState) {
              return const Loader();
            } else if (state is ErrorState) {
              return ErrorDisplay(onRefresh: cubit.refresh);
            }

            state as DataState;
            final movie = state.movie;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CachedUrlImage(
                        url: movie.backdropImageUrl,
                        width: double.infinity,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        left: 8,
                        child: Container(
                          decoration: ShapeDecoration(
                            shape: const StadiumBorder(),
                            color: Colors.grey.withOpacity(0.7),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[700],
                                ),
                                const Gap(4),
                                UIText(
                                  movie.rating.toStringAsFixed(1),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                const Gap(8),
                                if (movie.releaseDate != null) ...[
                                  const UIDivider(
                                    direction: DividerDirection.vertical,
                                    color: Colors.white,
                                    thickness: 2,
                                  ),
                                  const Gap(8),
                                  UIText(
                                    cubit.formatDate(movie.releaseDate!),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UIText(
                            movie.title,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          const Gap(12),
                          UIText(
                            cubit.getGenre(movie.genres),
                            color: context.textColor.withOpacity(0.7),
                          ),
                          const Gap(32),
                          if (movie.overview.isNotEmpty)
                            _MovieOverview(
                              content: movie.overview,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MovieOverview extends StatelessWidget {
  final String content;

  const _MovieOverview({
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ReadMoreCubit>(param1: 7),
      child: BlocBuilder<ReadMoreCubit, ReadMoreState>(
        builder: (context, state) {
          final cubit = context.read<ReadMoreCubit>();

          return LayoutBuilder(
            builder: (context, constraints) {
              final isTextOverflown = cubit.isTextOverflown(
                content,
                maxWidth: constraints.maxWidth,
                textScaler: context.textScaler,
                style: context.themeData.textTheme.bodyMedium!,
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText(
                    content,
                    color: Colors.black,
                    maxLines: state.maxLines,
                    overflow:
                        state.isTextExpanded ? null : TextOverflow.ellipsis,
                  ),
                  if (isTextOverflown)
                    TextButton(
                      onPressed: cubit.toggleMoreLess,
                      child:
                          UIText(state.isTextExpanded ? 'Smanji' : '...više'),
                    )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
