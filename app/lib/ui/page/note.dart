import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_memo/notifier/note_list.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:model/note.dart';

class NotePage extends HookConsumerWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteList = ref.watch(noteListProvider.notifier);
    final itemFocusNode = useFocusNode();
    final titleState = useState<String>("");
    final summaryState = useState<String>("");
    // final itemIsFocused = useIsFocused(itemFocusNode);

    return Scaffold(
      appBar: AppBar(title: const Text('Create a note')),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          itemFocusNode.requestFocus();
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: TextField(
                  style: Theme.of(context).textTheme.titleLarge,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Title',
                  ),
                  onChanged: (s) {
                    titleState.value = s;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  focusNode: itemFocusNode,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Summary',
                  ),
                  onChanged: (s) {
                    summaryState.value = s;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (titleState.value.isNotEmpty && summaryState.value.isNotEmpty) {
            await noteList
                .addNote(
              Note(
                title: titleState.value,
                summary: summaryState.value,
              ),
            )
                .then((_) {
              context.pop();
            });
          } else {
            debugPrint('title or summary is empty.');
          }
        },
        child: const Icon(Icons.note_add),
      ),
    );
  }
}

// bool useIsFocused(FocusNode node) {
//   final isFocused = useState(node.hasFocus);
//   useEffect(
//     () {
//       void listener() {
//         isFocused.value = node.hasFocus;
//       }
//       node.addListener(listener);
//       return () => node.removeListener(listener);
//     },
//     [node],
//   );
//   return isFocused.value;
// }
