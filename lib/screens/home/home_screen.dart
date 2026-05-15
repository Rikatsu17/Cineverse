import 'package:flutter/material.dart';

import '../../components/category_chip.dart';
import '../../components/movie_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        'title': 'Interstellar',
        'rating': 8.6,
        'image':
        'https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg',
      },
      {
        'title': 'Dune',
        'rating': 8.2,
        'image':
        'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
      },
      {
        'title': 'Batman',
        'rating': 7.9,
        'image':
        'https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg',
      },
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
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),

      body: SingleChildScrollView(
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

                separatorBuilder: (_, __) =>
                const SizedBox(width: 16),

                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return MovieCard(
                    imageUrl: movie['image'] as String,
                    title: movie['title'] as String,
                    rating: movie['rating'] as double,
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

            Wrap(
              spacing: 12,
              runSpacing: 12,

              children: categories
                  .map(
                    (category) => CategoryChip(
                  title: category,
                ),
              )
                  .toList(),
            ),

            const SizedBox(height: 32),

            const Text(
              'Popular Movies',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              itemCount: movies.length * 2,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.6,
              ),

              itemBuilder: (context, index) {
                final movie = movies[index % movies.length];

                return MovieCard(
                  imageUrl: movie['image'] as String,
                  title: movie['title'] as String,
                  rating: movie['rating'] as double,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}