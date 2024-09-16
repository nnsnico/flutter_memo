import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'repository.dart';
import 'note_repository.dart';
import 'package:model/note.dart';
import 'package:datastore/provider.dart';

part 'provider.g.dart';

@riverpod
Repository<Note> noteRepository(NoteRepositoryRef ref) {
  final localDataSource = ref.watch(noteDataSourceProvider);
  return NoteRepository(localDataSource);
}
