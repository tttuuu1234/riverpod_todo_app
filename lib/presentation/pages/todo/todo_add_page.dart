import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/presentation/controllers/todo/todo_add_controller.dart';
import 'package:riverpod_todo_app/presentation/controllers/todo/todo_list_controller.dart';

class TodoAddPage extends ConsumerWidget {
  const TodoAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('画面がビルドされたよ！');
    final todoAddState = ref.watch(todoAddProvider);
    final todoAddNotifier = ref.read(todoAddProvider.notifier);
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
