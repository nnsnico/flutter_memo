import 'package:repository/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:model/note.dart';

part 'add_note.g.dart';

@riverpod
Future<void> addNote(AddNoteRef ref, Note target) async {
  final noteRepository = ref.watch(noteRepositoryProvider);
  await noteRepository.add(target);
  ref.invalidate(noteRepositoryProvider);
}
