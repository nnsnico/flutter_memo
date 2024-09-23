import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'note_repository.dart';
import 'package:model/note.dart';
import 'package:model/local_repository.dart';
import 'package:datastore/note_datasource.dart';

part 'generated/provider.g.dart';

@riverpod
LocalRepository<Note> noteRepository(NoteRepositoryRef ref) {
  final localDataSource = ref.watch(noteDataSourceProvider);
  return NoteRepository(localDataSource);
}
