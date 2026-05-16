import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants.dart';
import '../../providers/watchlist_provider.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlistAsync = ref.watch(watchlistProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: watchlistAsync.when(
        data: (movies) {
          if (movies.isEmpty) {
            return const Center(
              child: Text('No notifications yet'),
            );
          }

          // reverse чтобы последние были сверху
          final reversed = movies.reversed.toList();

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: reversed.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final movie = reversed[index];

              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '$imageBaseUrl${movie.posterPath}',
                    width: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(Icons.movie),
                  ),
                ),
                title: Text(
                  '🎬 Added to Watchlist',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(movie.title),
                trailing: const Icon(Icons.bookmark_added),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}