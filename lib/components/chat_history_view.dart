import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tutorial/app_state.dart';
import 'package:flutter_tutorial/chat_data.dart';

class ChatHistoryView extends StatefulWidget {
  const ChatHistoryView({
    super.key,
  });

  @override
  State<ChatHistoryView> createState() => _ChatHistoryViewState();
}

class _ChatHistoryViewState extends State<ChatHistoryView> {
  ScrollController scrollController =
      ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onSurface,
      fontSize: 21,
    );
    // appStateの取得
    var appState = context.watch<AppState>();

    // チャット履歴
    // リストの0が最新のチャット内容になるようにする
    List<ChatData> ary = appState.history.toList();

    return Expanded(
        child: ListView(
      reverse: true, // trueにするとinitalScrollOffset:0 で一番下スタートになる
      controller: scrollController,
      children: [
        for (ChatData chat in ary)
          if (chat.type == ChatMessageType.sent)
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
