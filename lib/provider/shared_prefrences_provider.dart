// class FetchNotifier extends AutoDisposeNotifier<bool> {
//   @override
//   bool build() => false;

//   void fetch() => state = true;
// }

// final fetchNotifierProvider =
//     NotifierProvider.autoDispose<FetchNotifier, bool>(FetchNotifier.new);

import 'dart:async';
import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefs = AutoDisposeFutureProvider(
    (ref) async => await SharedPreferences.getInstance());

class SPrefNotifier extends AutoDisposeAsyncNotifier<List<String>> {
  @override
  FutureOr<List<String>> build() {
    final prefs = ref.watch(sharedPrefs);
    return prefs.value!.getStringList('listIds') ?? [];
  }

  // void addToList(String newValue) async {
  //   final prefs = ref.watch(sharedPrefs);
  //   state = state.value!.add(newValue);

  //   await prefs.value!.setStringList('listIds', state);
  // }
}

final sharedPreferencesProvider =
    NotifierProvider.autoDispose<SPrefNotifier, List<String>>(
        SPrefNotifier.new);
