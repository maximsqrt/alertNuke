import 'package:flutter/material.dart';

import 'package:riverpod/riverpod.dart';

final savedIconsProvider = StateNotifierProvider<SavedIconsNotifier, List<IconData>>((ref) {
  return SavedIconsNotifier();
});

class SavedIconsNotifier extends StateNotifier<List<IconData>> {
  SavedIconsNotifier() : super([]);

  void addIcon(IconData icon) {
    state = [...state, icon];
  }
}
