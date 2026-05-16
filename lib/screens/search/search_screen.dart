import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../providers/search_provider.dart';
import '../details/movie_details_screen.dart';
import '../../providers/search_history_provider.dart';

import 'package:go_router/go_router.dart';
class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {
    final moviesAsync =
    ref.watch(searchMoviesProvider);
    final history =
    ref.watch(searchHistoryProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),

            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon:
                const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                ),
              ),

              onChanged: (value) {
                ref
                    .read(
                  searchQueryProvider.notifier,
                )
                    .state = value;
              },

              onSubmitted: (value) {
                ref
                    .read(
                  searchHistoryProvider.notifier,
                )
                    .addSearch(value);
              },
            ),
          ),
          if (history.isNotEmpty)
            Padding(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: [
                      const Text(
                        'Recent Searches',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          ref
                              .read(
                            searchHistoryProvider
                                .notifier,
                          )
                              .clearHistory();
                        },

                        child: const Text(
                          'Clear',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 40,

                    child: ListView.separated(
                      scrollDirection:
                      Axis.horizontal,

                      itemCount: history.length,

                      separatorBuilder:
                          (_, __) =>
                      const SizedBox(
                        width: 8,
                      ),

                      itemBuilder:
                          (context, index) {
                        final item =
                        history[index];

                        return ActionChip(
                          label: Text(item),

                          onPressed: () {
                            ref
                                .read(
                              searchQueryProvider
                                  .notifier,
                            )
                                .state = item;
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          Expanded(
            child: moviesAsync.when(
              data: (movies) {
                if (movies.isEmpty) {
                  return const Center(
                    child: Text(
                      'Search for movies',
                    ),
                  );
                }

                return ListView.separated(
                  padding:
                  const EdgeInsets.all(16),

                  itemCount: movies.length,

                  separatorBuilder:
                      (_, __) =>
                  const SizedBox(
                    height: 16,
                  ),

                  itemBuilder:
                      (context, index) {
                    final movie =
                    movies[index];

                    return ListTile(
                      contentPadding:
                      const EdgeInsets.all(
                        12,
                      ),

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius
                            .circular(
                          20,
                        ),
                      ),

                      tileColor:
                      Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest,

                      leading: ClipRRect(
                        borderRadius:
                        BorderRadius
                            .circular(
                          12,
                        ),

                        child: Image.network(
                          '$imageBaseUrl${movie.posterPath}',
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),

                      title: Text(
                        movie.title,
                      ),

                      subtitle: Text(
                        '⭐ ${movie.voteAverage.toStringAsFixed(1)}',
                      ),

                      onTap: () {
                        context.push(
                          '/details',
                          extra: movie,
                        );
                      },
                    );
                  },
                );
              },

              loading: () => const Center(
                child:
                CircularProgressIndicator(),
              ),

              error: (error, stack) =>
                  Center(
                    child: Text(
                      error.toString(),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}