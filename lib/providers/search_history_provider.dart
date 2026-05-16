import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final searchHistoryProvider =
StateNotifierProvider<
    SearchHistoryNotifier,
    List<String>
>(
      (ref) => SearchHistoryNotifier(),
);

class SearchHistoryNotifier
    extends StateNotifier<List<String>> {
  SearchHistoryNotifier() : super([]) {
    loadHistory();
  }

  Future<void> loadHistory() async {
    final prefs =
    await SharedPreferences.getInstance();

    state =
        prefs.getStringList(
          'search_history',
        ) ??
            [];
  }

  Future<void> addSearch(
      String query,
      ) async {
    if (query.trim().isEmpty) {
      return;
    }

    final prefs =
    await SharedPreferences.getInstance();

    final updatedHistory = [
      query,
      ...state.where(
            (item) => item != query,
      ),
    ];

    state = updatedHistory.take(10).toList();

    await prefs.setStringList(
      'search_history',
      state,
    );
  }

  Future<void> clearHistory() async {
    final prefs =
    await SharedPreferences.getInstance();

    await prefs.remove('search_history');

    state = [];
  }
}