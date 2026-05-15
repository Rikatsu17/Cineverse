import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class WatchlistTable extends Table {
  IntColumn get id => integer()();

  TextColumn get title => text()();

  TextColumn get posterPath => text()();

  RealColumn get voteAverage => real()();

  TextColumn get overview => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [WatchlistTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> addToWatchlist(
      WatchlistTableCompanion movie,
      ) async {
    await into(watchlistTable)
        .insertOnConflictUpdate(movie);
  }

  Future<List<WatchlistTableData>>
  getWatchlistMovies() async {
    return await select(watchlistTable).get();
  }

  Future<void> removeFromWatchlist(
      int id,
      ) async {
    await (delete(watchlistTable)
      ..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder =
    await getApplicationDocumentsDirectory();

    final file = File(
      p.join(
        dbFolder.path,
        'cineverse.sqlite',
      ),
    );

    return NativeDatabase(file);
  });
}