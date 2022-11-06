import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/presentation/controllers/todo/todo_edit_controller.dart';
import 'package:riverpod_todo_app/presentation/states/todo/todo_state.dart';

import '../../controllers/todo/todo_list_controller.dart';

/// Todo編集画面
class TodoEditPage extends ConsumerWidget {
  const TodoEditPage({
    super.key,
    required this.todoState,
  });

  final TodoState todoState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoEditState = ref.watch(todoEditProviderFamily(todoState));
    final todoEditNotifier =
        ref.read(todoEditProviderFamily(todoState).notifier);
    final todoListNotifier = ref.read(todoListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoEdit'),
      ),
      body: Column(
        children: [
          TextFormField(
            initialValue: todoState.title,
            onChanged: ((value) {
              todoEditNotifier.setTitle(value);
            }),
          ),
          ElevatedButton(
            onPressed: () {
              todoListNotifier.edit(todoEditState);
              Navigator.pop(context);
            },
            child: const Text('Edit'),
          )
        ],
      ),
    );
  }
}
