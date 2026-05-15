import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/chopper_client.dart';
import '../constants.dart';
import '../models/movie.dart';
import '../models/movie_response.dart';

final searchQueryProvider =
StateProvider<String>((ref) => '');

final searchMoviesProvider =
FutureProvider<List<Movie>>(
      (ref) async {
    final query =
    ref.watch(searchQueryProvider);

    if (query.isEmpty) {
      return [];
    }

    final response =
    await movieApiService.searchMovies(
      tmdbApiKey,
      query,
    );

    final movieResponse =
    MovieResponse.fromJson(
      response.body,
    );

    return movieResponse.results;
  },
);