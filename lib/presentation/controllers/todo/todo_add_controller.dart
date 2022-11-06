import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/presentation/states/todo/todo_state.dart';
import 'package:uuid/uuid.dart';

final todoAddProvider =
    StateNotifierProvider.autoDispose<TodoAddController, TodoState>((ref) {
  ref.onDispose(() {
    print('破棄されました');
  });
  return TodoAddController();
});

class TodoAddController extends StateNotifier<TodoState> {
  TodoAddController()
      : super(
          TodoState(
            // インスタンスが作成れた時点で初期値としてidを付与していて良いものか、、
            // Addボタン押下時にidを付与するようにしたい
            // onPressed内でidを不要する処理を実装して、
            // 画面は更新されるがonPressed内の処理内部ではidが付与されたstateの更新はされない、、
            // つまりidは初期値として設定した空文字のままになるので、初期値としてidを設定している
            id: const Uuid().v4(),
            title: '',
            date: DateTime.now(),
          ),
        );

  /// タイトルの保持
  void setTitle(String value) {
    state = state.copyWith(title: value);
  }
}
