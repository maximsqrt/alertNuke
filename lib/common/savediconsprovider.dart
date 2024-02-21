import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class IconWithName {
  final IconData icon;
  final String name;

  IconWithName({required this.icon, required this.name});
}

final savedIconsProvider = StateNotifierProvider<SavedIconsNotifier, List<IconWithName>>((ref) {
  return SavedIconsNotifier();
});

class SavedIconsNotifier extends StateNotifier<List<IconWithName>> {
  SavedIconsNotifier() : super([]);

  void addIcon(IconWithName iconWithName) {
    state = [...state, iconWithName];
  }
}
