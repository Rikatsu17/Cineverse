import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import 'database_provider.dart';

final watchlistProvider =
FutureProvider<List<WatchlistTableData>>(
      (ref) async {
    final database =
    ref.watch(databaseProvider);

    return database.getWatchlistMovies();
  },
);