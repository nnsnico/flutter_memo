import 'package:model/note.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:repository/provider.dart';

part 'generated/get_note.g.dart';

@riverpod
Future<Note?> getNote(GetNoteRef ref, int? id) async {
  return ref.watch(noteRepositoryProvider.select((v) => v.findById(id)));
}
