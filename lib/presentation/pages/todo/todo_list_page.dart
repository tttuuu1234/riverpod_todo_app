import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/presentation/controllers/todo/todo_list_controller.dart';
import 'package:riverpod_todo_app/presentation/pages/todo/todo_add_page.dart';
import 'package:riverpod_todo_app/presentation/states/todo_list/todo_list_state.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListState = ref.watch(todoListProvider);
    final todoListNotifier = ref.watch(todoListProvider.notifier);

    print('TodoLIst画面ビルドされた');

    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoList'),
      ),
      body: TodoListView(
        todoListState: todoListState,
        todoListNotifier: todoListNotifier,
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

class TodoListView extends StatelessWidget {
  const TodoListView({
    Key? key,
    required this.todoListState,
    required this.todoListNotifier,
  }) : super(key: key);

  final TodoListState todoListState;
  final TodoListController todoListNotifier;

  @override
  Widget build(BuildContext context) {
    if (todoListState.list.isEmpty) {
      return const Center(
        child: Text('Add todo please'),
      );
    }

    return ListView.builder(
      itemCount: todoListState.list.length,
      itemBuilder: ((context, index) {
        final todo = todoListState.list[index];

        return Dismissible(
          key: ValueKey(todo.id),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            color: Colors.redAccent[700],
            child: const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
          confirmDismiss: ((direction) {
            return showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: const Text('削除しますか？'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('cansel'),
                    ),
                    TextButton(
                      onPressed: () {
                        todoListNotifier.delete(todo.id);
                        Navigator.pop(context);
                      },
                      child: const Text('delete'),
                    )
                  ],
                );
              }),
            );
          }),
          child: Card(
            child: ListTile(
              title: Text(todo.title),
              onLongPress: () {
                print('ロング');
              },
            ),
          ),
        );
      }),
    );
  }
}
