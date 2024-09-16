import 'package:flutter/material.dart';
import 'package:flutter_memo/ui/widget/note_list.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Memo')),
      body: const NoteList(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'note_button',
        onPressed: () => context.go('/note'),
        tooltip: 'Create a note',
        child: const Icon(Icons.note),
      ),
    );
  }
}
