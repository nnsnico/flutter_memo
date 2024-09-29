// Mocks generated by Mockito 5.4.4 from annotations
// in domain/test/note/add_note_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:model/local_repository.dart' as _i2;
import 'package:model/note.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [LocalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalRepository extends _i1.Mock
    implements _i2.LocalRepository<_i3.Note> {
  @override
  _i4.Future<void> add(_i3.Note? value) => (super.noSuchMethod(
        Invocation.method(
          #add,
          [value],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<List<_i3.Note>> getAll() => (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue: _i4.Future<List<_i3.Note>>.value(<_i3.Note>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i3.Note>>.value(<_i3.Note>[]),
      ) as _i4.Future<List<_i3.Note>>);

  @override
  _i4.Future<void> remove(_i3.Note? value) => (super.noSuchMethod(
        Invocation.method(
          #remove,
          [value],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i3.Note?> findById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #findById,
          [id],
        ),
        returnValue: _i4.Future<_i3.Note?>.value(),
        returnValueForMissingStub: _i4.Future<_i3.Note?>.value(),
      ) as _i4.Future<_i3.Note?>);
}
