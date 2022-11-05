import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/presentation/states/todo/todo_state.dart';

final todoAddProvider =
    StateNotifierProvider<TodoAddController, TodoState>((_) {
  return TodoAddController();
});

class TodoAddController extends StateNotifier<TodoState> {
  TodoAddController()
      : super(
          TodoState(title: '', date: DateTime.now()),
        );

  void setTitle(String value) {
    state = state.copyWith(title: value);
  }
}
