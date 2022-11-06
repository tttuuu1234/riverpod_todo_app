import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/presentation/controllers/todo/todo_add_controller.dart';
import 'package:riverpod_todo_app/presentation/controllers/todo/todo_list_controller.dart';

/// Todo追加画面
class TodoAddPage extends ConsumerWidget {
  const TodoAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoAddState = ref.watch(todoAddProvider);
    final todoAddNotifier = ref.watch(todoAddProvider.notifier);
    final todoListNotifier = ref.read(todoListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoAdd'),
      ),
      body: Column(
        children: [
          TextFormField(
            onChanged: ((value) {
              todoAddNotifier.setTitle(value);
            }),
          ),
          ElevatedButton(
            onPressed: () {
              todoListNotifier.add(todoAddState);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}
