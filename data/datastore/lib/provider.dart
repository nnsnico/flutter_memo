import 'note_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
NoteDataSource noteDataSource(NoteDataSourceRef ref) {
  return NoteDataSource();
}
