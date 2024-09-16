import 'local_datasource.dart';
import 'note_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:model/note.dart';

part 'provider.g.dart';

@riverpod
LocalDataSource<Note> noteDataSource(NoteDataSourceRef ref) {
  return NoteDataSource();
}
