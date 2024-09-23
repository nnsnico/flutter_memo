import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:repository/note_repository.dart';
import 'package:model/note.dart';

part 'generated/remove_note.g.dart';

@riverpod
Future<void> removeNote(RemoveNoteRef ref, Note note) async {
  final noteRepository = ref.watch(noteRepositoryProvider);
  await noteRepository.remove(note);
  ref.invalidate(noteRepositoryProvider);
}
