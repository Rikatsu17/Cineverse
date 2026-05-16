import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/movie.dart';
import '../screens/details/movie_details_screen.dart';
import '../home.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
      const Home(),
    ),

    GoRoute(
      path: '/details',

      builder: (context, state) {
        final movie =
        state.extra as Movie;

        return MovieDetailsScreen(
          movie: movie,
        );
      },
    ),
  ],
);