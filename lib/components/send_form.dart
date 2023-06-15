import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  Future<Map> sendChatMessage(String message) async {
    await dotenv.load(fileName: '.env');
    String apiKey = dotenv.get('API_KEY');

    var response = await http.post(
      // TODO: constとして定義しておくといい
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo-0613",
        "max_tokens": 256,
        "messages": [
          {
            "role": "system",
            "content":
                "Please make all responses in sentences of up to 256 tokens."
          },
          {"role": "user", "content": message},
        ]
      }),
    );
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // appStateの取得
    var appState = context.watch<AppState>();

    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            key: const Key("sendTextField"),
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
          key: const Key("sendBtn"),
          onPressed: () => sendBtnOnPressed(appState),
          icon: const Icon(Icons.send),
          color: theme.colorScheme.primary,
          iconSize: 40,
        )
      ],
    );
  }

  void sendBtnOnPressed(AppState appState) {
    if (appState.current.isEmpty) {
      return;
    }
    String current = appState.current;
    appState.addHistory(ChatData(ChatMessageType.sent, current));
    sendChatMessage(current).then((response) {
      if (response.containsKey('error')) {
        appState.addHistory(ChatData(ChatMessageType.received, 'エラーが発生しました'));
      } else {
        String msg = response['choices'][0]['message']['content'];
        appState.addHistory(ChatData(ChatMessageType.received, msg));
      }
    }).catchError((error) {
      appState.addHistory(
          ChatData(ChatMessageType.received, '通信時にエラーが発生しました。$error'));
    });
    _editController.clear();
    appState.setCurrent('');
  }
}
