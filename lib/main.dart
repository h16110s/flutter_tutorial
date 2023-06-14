import 'package:flutter/material.dart';
import 'package:flutter_tutorial/components/chat_history_view.dart';
import 'package:flutter_tutorial/components/send_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チャットアプリ'),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 40.0),
        child: Column(
          children: [
            // チャット履歴
            ChatHistoryView(),

            // 送信フォーム
            SendForm(),
          ],
        ),
      ),
    );
  }
}

