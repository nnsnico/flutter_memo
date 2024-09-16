import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:repository/provider.dart';
import 'package:model/note.dart';

part 'remove_note.g.dart';

@riverpod
Future<void> removeNote(RemoveNoteRef ref, Note note) async {
  final noteRepository = ref.watch(noteRepositoryProvider);
  await noteRepository.remove(note);
  ref.invalidate(noteRepositoryProvider);
}
