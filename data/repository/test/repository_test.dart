import 'package:datastore/note_datasource.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:model/note.dart';
import 'package:repository/note_repository.dart';

@GenerateNiceMocks([MockSpec<NoteDataSource>()])
import 'mocks/repository_test.mocks.dart';

Future<void> main() async {
  late NoteDataSource dataSource;

  setUp(() {
    dataSource = MockNoteDataSource();
  });

  group('NoteRepository', () {
    test(
        '`getAll` should return them when there are one or more value in dataSource',
        () async {
      final expectValue = [
        const Note(id: 1, title: 'test 1', summary: 'test 1 summary'),
        const Note(id: 2, title: 'test 2', summary: 'test 2 summary'),
        const Note(id: 3, title: 'test 3', summary: 'test 3 summary'),
      ];
      when(dataSource.queryAll()).thenAnswer((_) async => expectValue);

      final NoteRepository noteRepository = NoteRepository(dataSource);
      final result = await noteRepository.getAll();
      expect(result, expectValue);
    });

    test(
        '`getAll` should return them when there are one or more value in dataSource',
        () async {
      when(dataSource.queryAll()).thenAnswer((_) async => null);
      final NoteRepository noteRepository = NoteRepository(dataSource);
      final result = await noteRepository.getAll();
      expect(result, []);
    });
  });
}
