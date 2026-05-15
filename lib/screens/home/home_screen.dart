import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/category_chip.dart';
import '../../components/movie_card.dart';
import '../../constants.dart';
import '../../providers/movie_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAsync = ref.watch(
      trendingMoviesProvider,
    );
    final categories = [
      'Action',
      'Sci-Fi',
      'Drama',
      'Anime',
      'Horror',
      'Comedy',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CineVerse',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),

        body: moviesAsync.when(
          data: (movies) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  const Text(
                    'Trending Now',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 260,

                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,

                      itemCount: movies.length,

                      separatorBuilder: (_, __) =>
                      const SizedBox(width: 16),

                      itemBuilder: (context, index) {
                        final movie = movies[index];

                        return MovieCard(
                          imageUrl:
                          '$imageBaseUrl${movie.posterPath}',

                          title: movie.title,

                          rating: movie.voteAverage,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },

          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),

          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
        ),
    );
  }
}