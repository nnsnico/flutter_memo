import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'note.freezed.dart';

@freezed
class Note with _$Note {
  const Note._();

  const factory Note({
    int? id,
    required String title,
    required String summary,
  }) = _Note;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(id: map['id'], title: map['title'], summary: map['summary']);
  }
}
