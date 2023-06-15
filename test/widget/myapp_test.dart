// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial/components/chat_history_view.dart';
import 'package:flutter_tutorial/components/send_form.dart';
import 'package:flutter_tutorial/main.dart';

void main() {
  testWidgets('App Launch Test', (WidgetTester tester) async {
    // MyAppが起動するまで待つ
    await tester.pumpWidget(const MyApp());

    // MyAppの中にChatHistoryViewがあるか確認
    expect(find.byType(ChatHistoryView), findsOneWidget);
    // MyAppの中にSendFormがあるか確認
    expect(find.byType(SendForm), findsOneWidget);
  });
}
