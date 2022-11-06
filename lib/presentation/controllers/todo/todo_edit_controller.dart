import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/presentation/states/todo/todo_state.dart';

final todoEditProviderFamily =
    StateNotifierProvider.family<TodoEditController, TodoState, TodoState>(
        (ref, todo) {
  print('TodoEditProvider作成');
  print(todo);

  return TodoEditController(todo);
});

class TodoEditController extends StateNotifier<TodoState> {
  TodoEditController(this._todoState)
      : super(
          TodoState(
            id: '',
            title: '',
            date: DateTime.now(),
          ),
        ) {
    _setEditTargetTodo();
  }

  final TodoState _todoState;

  /// 編集対象のTodoをStateとして保持
  void _setEditTargetTodo() {
    state = _todoState;
  }

  /// タイトルの保持
  void setTitle(String title) {
    state = state.copyWith(title: title);
  }
}
