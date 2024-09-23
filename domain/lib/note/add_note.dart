import 'package:repository/note_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:model/note.dart';

part 'generated/add_note.g.dart';

@riverpod
Future<void> addNote(AddNoteRef ref, Note target) async {
  final noteRepository = ref.watch(noteRepositoryProvider);
  await noteRepository.add(target);
  ref.invalidate(noteRepositoryProvider);
}
