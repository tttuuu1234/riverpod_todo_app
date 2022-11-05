import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/presentation/controllers/todo/todo_list_controller.dart';
import 'package:riverpod_todo_app/presentation/pages/todo/todo_add_page.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListState = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoList'),
      ),
      body: ListView.builder(
        itemCount: todoListState.list.length,
        itemBuilder: ((context, index) {
          final todo = todoListState.list[index];
          return ListTile(
            title: Text(todo.title),
            onLongPress: () {
              print('ロング');
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return const TodoAddPage();
              }),
            ),
          );
        },
      ),
    );
  }
}
