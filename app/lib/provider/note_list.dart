import 'dart:async';

import 'package:flutter_memo/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:model/note.dart';

final noteListProvider =
    AsyncNotifierProvider<_NoteListNotifier, List<Note>>(() {
  return _NoteListNotifier();
});

class _NoteListNotifier extends AsyncNotifier<List<Note>> {
  Future<void> addNote(Note note) async {
    final repository = ref.read(noteRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repository.add(note);
      return repository.getAll();
    });
  }

  @override
  Future<List<Note>> build() {
    final repository = ref.read(noteRepositoryProvider);
    return repository.getAll();
  }

  Future<void> removeNote(Note note) async {
    final repository = ref.read(noteRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await repository.remove(note);
      return repository.getAll();
    });
  }
}
