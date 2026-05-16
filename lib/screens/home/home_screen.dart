import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/category_chip.dart';
import '../../components/movie_card.dart';
import '../../constants.dart';
import '../../providers/movie_provider.dart';

import '../../components/activity_card.dart';
import '../../components/category_card.dart';

import '../details/movie_details_screen.dart';

import 'package:go_router/go_router.dart';
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAsync = ref.watch(trendingMoviesProvider);
    final activities = [
      {
        'activity': 'Alikhan watched the movie iron man',
        'time': '10 mins ago',
      },
      {
        'activity': 'Yerulan liked the serial the boys',
        'time': '1 hour ago',
      },
      {
        'activity': "Asqar's favorite movie is forest gump",
        'time': '2 hours ago',
      },
    ];

    final categoryImages = [
      {'title': 'Action', 'image': 'assets/categories/action.jfif'},
      {'title': 'Comedy', 'image': 'assets/categories/comedy.jfif'},
      {'title': 'Drama', 'image': 'assets/categories/drama.jfif'},
      {'title': 'Anime', 'image': 'assets/categories/anime.jfif'},
      {'title': 'Horror', 'image': 'assets/categories/horror.jfif'},
      {'title': 'Sci-Fi', 'image': 'assets/categories/sci-fi.jfif'},
    ];
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
            onPressed: () {
              context.push('/notifications');
            },
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: moviesAsync.when(
        data: (movies) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return MovieCard(
                        imageUrl: '$imageBaseUrl${movie.posterPath}',
                        title: movie.title,
                        rating: movie.voteAverage,
                        onTap: () {
                          context.push(
                            '/details',
                            extra: movie,
                          );
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 32),

                const Text(
                  "Friend's Activity",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  height: 110,

                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,

                    itemCount: activities.length,

                    separatorBuilder: (_, __) =>
                    const SizedBox(width: 16),

                    itemBuilder: (context, index) {
                      final activity = activities[index];

                      return ActivityCard(
                        username: '',
                        activity: activity['activity']!,
                        time: activity['time']!,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32),

                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  height: 220,

                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,

                    itemCount: categoryImages.length,

                    separatorBuilder: (_, __) =>
                    const SizedBox(width: 16),

                    itemBuilder: (context, index) {
                      final category = categoryImages[index];

                      return CategoryCard(
                        title: category['title']!,
                        imageUrl: category['image']!,
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
          child: Text('Ошибка: ${error.toString()}'),
        ),
      ),
    );
  }
}