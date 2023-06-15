//testコードはこれをimport
import 'package:flutter_test/flutter_test.dart';
//インテグレーションtestコードはこれをimport
import 'package:integration_test/integration_test.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/main.dart'
    as app; // as appでrunAppを記述したdartファイルを呼び出す。

void main() {
  // インテグレーションテストの場合はこれを１行目に書く
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // テストをグループ化するコード
  group('end-to-end test', () {
    // Widgetテストのコード
    testWidgets('チャットの送信テスト', (WidgetTester tester) async {
      // ここでrunAppを起動
      app.main();
      // pumpAndSettleで画面の起動を待つ
      await tester.pumpAndSettle();

      // 初期値を確認
      expect(find.text('こんにちは'), findsOneWidget);

      // Widgetに設定したKeyを元に、Finderを作成
      final Finder textField = find.byKey(const Key('sendTextField'));
      final Finder btn = find.byKey(const Key('sendBtn'));

      const String inputText = "おはよう";
      // おはようを入力
      await tester.enterText(textField, inputText);
      // ボタン押下
      await tester.tap(btn);
      // 画面更新
      await tester.pumpAndSettle();

      // 入力文字を含むWidgetが存在するか確認
      expect(find.text(inputText), findsOneWidget);

      // 画面更新（APIレスポンスがあるかを確かめる）
      await tester.pumpAndSettle();
    });
  });
}
