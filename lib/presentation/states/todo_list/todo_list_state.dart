import 'package:freezed_annotation/freezed_annotation.dart';

import '../todo/todo_state.dart';

part 'todo_list_state.freezed.dart';

@freezed
class TodoListState with _$TodoListState {
  const factory TodoListState({
    @Default([]) List<TodoState> list,
  }) = _TodoListState;
}
