import 'package:flutter/material.dart';
import 'package:flutter_memo/notifier/note_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:model/note.dart';

class DetailPage extends ConsumerWidget {
  final int noteId;

  const DetailPage(this.noteId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteList = ref.watch(noteListProvider);
    final Note? note = noteList.value?.lastWhere((v) => v.id == noteId);

    if (note != null) {
      return Scaffold(
        appBar: AppBar(title: Text(note.title)),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                note.summary,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      );
    } else {
      return const Center(child: Text('Internal Error'));
    }
  }
}
