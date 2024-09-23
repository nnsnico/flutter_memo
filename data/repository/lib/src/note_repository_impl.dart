import 'package:model/note.dart';
import 'package:model/local_repository.dart';
import 'package:datastore/note_datasource.dart';

final class NoteRepositoryImpl extends LocalRepository<Note> {
  NoteRepositoryImpl(this._dataSource);

  final NoteDataSource _dataSource;

  @override
  Future<void> add(Note value) => _dataSource.insert(value);

  @override
  Future<List<Note>> getAll() async => _dataSource.queryAll().then((value) {
        if (value == null) {
          return [];
        } else {
          return value;
        }
      });

  @override
  Future<void> remove(Note value) => _dataSource.delete(value);

  @override
  Future<Note?> findById(int? id) => _dataSource.findNoteById(id);
}
