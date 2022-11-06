import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/presentation/states/todo/todo_state.dart';
import 'package:uuid/uuid.dart';

final todoAddProvider =
    StateNotifierProvider<TodoAddController, TodoState>((_) {
  return TodoAddController();
});

class TodoAddController extends StateNotifier<TodoState> {
  TodoAddController()
      : super(
          TodoState(id: '', title: '', date: DateTime.now()),
        );

  final _uuid = const Uuid();

  void setId() {
    state = state.copyWith(id: _uuid.v4());
  }

  void setTitle(String value) {
    state = state.copyWith(title: value);
  }
}
