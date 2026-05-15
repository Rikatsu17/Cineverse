import 'package:cached_network_image/cached_network_image.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../database/app_database.dart';
import '../../models/movie.dart';
import '../../providers/database_provider.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final Movie movie;

  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,

            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.title),

              background: CachedNetworkImage(
                imageUrl:
                '$imageBaseUrl${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),

                      const SizedBox(width: 8),

                      Text(
                        movie.voteAverage
                            .toStringAsFixed(1),

                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    movie.overview,

                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,

                    child: FilledButton.icon(
                      onPressed: () async {
                        final database =
                        ref.read(
                          databaseProvider,
                        );

                        await database
                            .addToWatchlist(
                          WatchlistTableCompanion.insert(
                            id: Value(movie.id),
                            title: movie.title,
                            posterPath:
                            movie.posterPath,
                            voteAverage:
                            movie.voteAverage,
                            overview:
                            movie.overview,
                          ),
                        );

                        if (context.mounted) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Added to Watchlist',
                              ),
                            ),
                          );
                        }
                      },

                      icon: const Icon(
                        Icons.bookmark,
                      ),

                      label: const Text(
                        'Add to Watchlist',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}