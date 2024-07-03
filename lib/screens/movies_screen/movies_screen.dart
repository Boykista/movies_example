import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_example/screens/movies_screen/bloc/movies_screen_cubit.dart';
import 'package:movies_example/screens/movies_screen/bloc/movies_screen_state.dart';
import 'package:movies_example/routing/routes/routes.dart';
import 'package:movies_example/shared/ui_components/cards/movie_preview_card.dart';
import 'package:movies_example/shared/ui_components/header.dart';
import 'package:movies_example/shared/ui_components/screen_container.dart';
import 'package:movies_example/shared/ui_components/state_display/error_display.dart';
import 'package:movies_example/shared/ui_components/state_display/loader.dart';
import 'package:movies_example/shared/ui_components/toast_message.dart';
import 'package:movies_example/utils/extensions/build_context_extension.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesScreenCubit(),
      child: ScreenContainer(
        header: const Header(
          showBackButton: false,
          titleText: 'Lista za gledanje',
        ),
        bottomInset: false,
        body: BlocProvider(
          create: (context) => MoviesScreenCubit(),
          child: BlocConsumer<MoviesScreenCubit, MoviesScreenState>(
            builder: (context, state) {
              final cubit = context.read<MoviesScreenCubit>();

              if (state is LoadingState) {
                return const Loader();
              } else if (state is ErrorState) {
                return ErrorDisplay(
                  onRefresh: cubit.refresh,
                );
              }

              final movies = state.movies;

              return ListView.separated(
                controller: cubit.scrollController,
                itemCount: movies.length + 1,
                padding: EdgeInsets.fromLTRB(
                    16, 16, 16, context.screenInsets.bottom + 16),
                itemBuilder: (context, index) {
                  if (index == movies.length) {
                    return const Loader();
                  }

                  final moviePreview = movies[index];

                  return MoviePreviewCard(
                    onTap: () => context.go(
                      Routes.movie(moviePreview.id),
                    ),
                    title: moviePreview.title,
                    releaseDate: moviePreview.releaseDate,
                    imageUrl: moviePreview.backdropImageUrl,
                    rating: moviePreview.rating,
                  );
                },
                separatorBuilder: (context, index) => const Gap(24),
              );
            },
            listenWhen: (previous, current) => current is ErrorLoadMoreToast,
            listener: (context, state) {
              final cubit = context.read<MoviesScreenCubit>();
              state as ErrorLoadMoreToast;
              showErrorToastMessage(
                context,
                message: state.message,
                onDismiss: cubit.onToastDismiss,
              );
            },
          ),
        ),
      ),
    );
  }
}
