import 'package:flutter_test/flutter_test.dart';
import 'package:model/local_repository.dart';
import 'package:model/note.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';
import 'package:repository/note_repository.dart';
import 'package:domain/note/remove_note.dart';

@GenerateNiceMocks([MockSpec<LocalRepository<Note>>()])
import '../mocks/note/remove_note_test.mocks.dart';

Future<void> main() async {
  late MockLocalRepository repository;

  setUp(() {
    repository = MockLocalRepository();
  });

  test(
      'removeNote should call successfully when a note can be deleted from NoteRepository',
      () async {
    const testCase = Note(id: 0, title: 'test title', summary: 'test summary');
    when(repository.remove(testCase)).thenAnswer((_) async => Future<void>);

    final container = ProviderContainer(
      overrides: [
        noteRepositoryProvider.overrideWithValue(repository),
      ],
    );

    await container.read(removeNoteProvider(testCase).future);

    verify(repository.remove(testCase)).called(1);
  });

  test('removeNote should throw when note deletion is throws something error', () async {
    const testCase = Note(id: 0, title: 'test title', summary: 'test summary');
    when(repository.remove(any)).thenAnswer((_) async => Future.error(Exception('error')));

    final container = ProviderContainer(
      overrides: [
        noteRepositoryProvider.overrideWithValue(repository),
      ],
    );

    expect(
      () async => await container.read(removeNoteProvider(testCase).future),
      throwsA(isA<Exception>()),
    );
  });
}
