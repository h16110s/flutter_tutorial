import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tutorial/app_state.dart';
import 'package:flutter_tutorial/chat_data.dart';

class SendForm extends StatefulWidget {
  const SendForm({
    super.key,
  });

  @override
  State<SendForm> createState() => _SendFormState();
}

class _SendFormState extends State<SendForm> {
  final _editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // appStateの取得
    var appState = context.watch<AppState>();

    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            controller: _editController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
            onChanged: (String text) {
              appState.setCurrent(text);
            },
          ),
        ),
        IconButton(
          onPressed: () {
            appState.addHistory(  
              ChatData(ChatMessageType.sent,appState.current)
            );
            _editController.clear();
          },
          icon: const Icon(Icons.send),
          color: theme.colorScheme.primary,
          iconSize: 40,
        )
      ],
    );
  }
}
