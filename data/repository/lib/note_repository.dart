import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:datastore/note_datasource.dart';
import 'package:model/note.dart';
import 'package:model/local_repository.dart';
import 'package:repository/src/note_repository_impl.dart';

part 'generated/note_repository.g.dart';

@riverpod
LocalRepository<Note> noteRepository(NoteRepositoryRef ref) {
  final localDataSource = ref.watch(noteDataSourceProvider);
  return NoteRepositoryImpl(localDataSource);
}
