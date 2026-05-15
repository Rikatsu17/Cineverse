import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/chopper_client.dart';
import '../constants.dart';
import '../models/movie.dart';
import '../models/movie_response.dart';

final trendingMoviesProvider =
FutureProvider<List<Movie>>((ref) async {
  final response =
  await movieApiService.getTrendingMovies(
    tmdbApiKey,
  );

  final movieResponse = MovieResponse.fromJson(
    response.body,
  );

  return movieResponse.results;
});