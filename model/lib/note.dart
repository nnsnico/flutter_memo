import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/note.freezed.dart';

@freezed
class Note with _$Note {
  const factory Note({
    int? id,
    required String title,
    required String summary,
  }) = _Note;

  factory Note.fromMap(Map<String, Object?> map) {
    return Note(
      id: map['id'] as int?,
      title: map['title'] as String,
      summary: map['summary'] as String,
    );
  }

  const Note._();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
    };
  }
}
