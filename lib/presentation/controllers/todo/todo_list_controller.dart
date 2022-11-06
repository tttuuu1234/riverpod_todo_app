import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/presentation/states/todo/todo_state.dart';
import 'package:riverpod_todo_app/presentation/states/todo_list/todo_list_state.dart';

final todoListProvider =
    StateNotifierProvider<TodoListController, TodoListState>((ref) {
  ref.onDispose(() {
    print('todoListProviderは破棄されました');
  });
  // todoListProvider内でtodoAddProviderをwatchしていたら、
  // todoAddProviderに変更があった場合、todoListProvider内の処理も再度行われてしまう
  // つまり、TodoListControllerクラスが別のインスタンスとなってしまい、保持していた状態がクリアされてしまう
  // final todo = ref.watch(todoAddProvider);
  return TodoListController();
});

class TodoListController extends StateNotifier<TodoListState> {
  TodoListController() : super(const TodoListState());

  void add(TodoState todoState) {
    state = state.copyWith(list: [
      todoState,
      ...state.list,
    ]);
  }

  void delete(String id) {
    final newTodoList =
        state.list.where((element) => element.id != id).toList();
    state = state.copyWith(list: newTodoList);
  }
}
