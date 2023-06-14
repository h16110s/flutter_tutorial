import 'package:flutter/material.dart';
import 'package:flutter_tutorial/chat_data.dart';

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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('チャットアプリ'),
      ),
      body: const Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40.0),
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

class ChatHistoryView extends StatelessWidget {
  const ChatHistoryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onSurface,
      fontSize: 21,
    );

    // TODO: AppStateから取得する
    List<ChatData> ary = [
      ChatData(ChatMessageType.sent, 'hello!'),
      ChatData(ChatMessageType.received, 'hello'),
      ChatData(ChatMessageType.sent, 'hello!'),
      ChatData(ChatMessageType.received, 'hello'),
      ChatData(ChatMessageType.sent, 'hello!'),
      ChatData(ChatMessageType.received, 'hello'),
      ChatData(ChatMessageType.sent, 'hello!'),
      ChatData(ChatMessageType.received, 'hello'),      
      ChatData(ChatMessageType.sent, 'hello!'),
      ChatData(ChatMessageType.received, 'hello'),
      ChatData(ChatMessageType.sent, 'hello!'),
      ChatData(ChatMessageType.received, 'hello'),      
      ChatData(ChatMessageType.sent, 'hello!'),
      ChatData(ChatMessageType.received, 'hello'),
      ChatData(ChatMessageType.sent, 'hello!'),
      ChatData(ChatMessageType.received, 'hello'),      
      ChatData(ChatMessageType.sent, 'hello!'),
      ChatData(ChatMessageType.received, 'hello'),
      ChatData(ChatMessageType.sent, 'hello!'),
      ChatData(ChatMessageType.received, 'hello'),
    ];

    return Expanded(
      child: ListView(
        children: [
          for (ChatData chat in ary)
            if (chat.from == 'user')
              ListTile(
                leading: const Icon(Icons.account_circle, color: Colors.blue),
                title: Text(chat.message, style: style),
              )
            else
              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  color: Colors.blueGrey,
                ),
                title: Text(chat.message, style: style),
              )
        ],
    ));
  }
}

class SendForm extends StatelessWidget {
  const SendForm({
    super.key,
  });

  // final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: <Widget>[
        const Flexible(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            print('btn pressed');
          },
          icon: const Icon(Icons.send),
          color: theme.colorScheme.primary,
          iconSize: 40,
        )
      ],
    );
  }
}
