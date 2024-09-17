import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:model/note.dart';
import 'package:repository/provider.dart';

part 'generated/get_list.g.dart';

@riverpod
Future<List<Note>> getNoteList(GetNoteListRef ref) async {
  return ref.watch(noteRepositoryProvider.select((v) => v.getAll()));
}
