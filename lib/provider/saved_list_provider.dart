import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/next_week_weather.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final noResultBoolNotifierProvider = StateProvider<bool>((ref) => false);

class SearchLSavedistNotifier extends Notifier<List<NextWeekWeather>> {
  @override
  build() => [];

  void onSearchSavedList(List<NextWeekWeather> savedList) {
    state = [];

    final query = ref.watch(searchQueryProvider);

    if (query.isNotEmpty) {
      final result = savedList
          .where(
            (element) => element.location.name
                .toString()
                .toLowerCase()
                .contains(query.toString().toLowerCase()),
          )
          .toSet()
          .toList();
      state.addAll(result);
      if (state.isEmpty) {
        ref.read(noResultBoolNotifierProvider.notifier).state = true;
      } else {
        ref.read(noResultBoolNotifierProvider.notifier).state = false;
      }
    } else {
      ref.read(noResultBoolNotifierProvider.notifier).state = false;
    }
  }
}

final searchSavedListNotifierProvider =
    NotifierProvider<SearchLSavedistNotifier, List<NextWeekWeather>>(
      SearchLSavedistNotifier.new,
    );

class SearchListBoolNotifier extends AutoDisposeNotifier<bool> {
  @override
  bool build() => false;

  void update() => state = !state;
}

final searchListBoolNotifierProvider =
    NotifierProvider.autoDispose<SearchListBoolNotifier, bool>(
      SearchListBoolNotifier.new,
    );
