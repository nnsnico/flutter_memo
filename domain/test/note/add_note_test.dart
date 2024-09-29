import 'package:flutter_test/flutter_test.dart';
import 'package:model/local_repository.dart';
import 'package:model/note.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';
import 'package:repository/note_repository.dart';
import 'package:domain/note/add_note.dart';

@GenerateNiceMocks([MockSpec<LocalRepository<Note>>()])
import '../mocks/note/add_note_test.mocks.dart';

Future<void> main() async {
  late MockLocalRepository repository;

  setUp(() {
    repository = MockLocalRepository();
  });

  test(
      'addNote should call successfully when a note can be inserted from NoteRepository',
      () async {
    const testCase = Note(id: 0, title: 'test title', summary: 'test summary');
    when(repository.add(testCase)).thenAnswer((_) async => Future<void>);

    final container = ProviderContainer(
      overrides: [
        noteRepositoryProvider.overrideWithValue(repository),
      ],
    );

    await container.read(addNoteProvider(testCase).future);

    verify(repository.add(testCase)).called(1);
  });

  test('addNote should throw when note insertion is throws something error', () async {
    const testCase = Note(id: 0, title: 'test title', summary: 'test summary');
    when(repository.add(any)).thenAnswer((_) async => Future.error(Exception('error')));

    final container = ProviderContainer(
      overrides: [
        noteRepositoryProvider.overrideWithValue(repository),
      ],
    );

    expect(
      () async => await container.read(addNoteProvider(testCase).future),
      throwsA(isA<Exception>()),
    );
  });
}
