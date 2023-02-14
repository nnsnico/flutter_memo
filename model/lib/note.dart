import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const factory Note({
    int? id,
    required String title,
    required String summary,
  }) = _Note;

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(id: map['id'], title: map['title'], summary: map['summary']);
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
