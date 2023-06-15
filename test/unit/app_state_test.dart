// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/app_state.dart';
import 'package:flutter_tutorial/chat_data.dart';

void main() {
  group('AppState Unit Test', () {
    test('check initial value', () {
      expect(AppState().history.length, 1);
      expect(AppState().history[0].message, 'こんにちは');
      expect(AppState().history[0].type, ChatMessageType.received);

      expect(AppState().current, '');
    });

    test('check addHistory method', () {
      final chatData = ChatData(ChatMessageType.sent, 'test');

      final AppState appState = AppState();

      appState.addHistory(chatData);

      expect(appState.history.length, 2);
      expect(appState.history[0].message, 'test');
      expect(appState.history[0].type, ChatMessageType.sent);
    });

    test('check setCurrent method', () {
      final AppState appState = AppState();

      appState.setCurrent('test');
      expect(appState.current, 'test');

      appState.setCurrent('');
      expect(appState.current, '');
    });
  });
}
